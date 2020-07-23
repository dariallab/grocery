package cart

import (
	"encoding/json"
	"time"

	"github.com/dariallab/grocery"
	"github.com/dariallab/grocery/pkg/platform/postgres"
	"github.com/jmoiron/sqlx"
	"github.com/pkg/errors"
)

// Service implements methods for managing cart
type Service struct {
	DB *postgres.DB
}

type recipeInDB struct {
	ID                    string `db:"id"`
	UserID                int    `db:"user_id"`
	IngredientsPerPortion []byte `db:"ingredients_per_portion"`
}

// GetMenu returns menu
func (r *Service) GetMenu(userID int) (grocery.Menu, error) {
	// check that menu exist (this day as part before to_date and after from_date

	var menuRaw []byte
	err := r.DB.Get(&menuRaw, `SELECT menu FROM schedules 
		WHERE user_id=$1 
			AND $2 > from_date
			AND $2 < to_date;`, userID, time.Now())
	if err != nil {
		return nil, err
	}

	var menu grocery.Menu
	if err := json.Unmarshal(menuRaw, &menu); err != nil {
		return nil, err
	}

	return menu, nil
}

// GetIngredients return ingredients
func (r *Service) GetIngredients(userID int, menu grocery.Menu) ([]*grocery.Ingredient, error) {
	var recipesIDs []string
	portions := make(map[string]int)
	for _, v := range menu {
		portions[v.RecipeID] = v.Portion
		recipesIDs = append(recipesIDs, v.RecipeID)
	}

	query, args, err := sqlx.In("SELECT * FROM recipes WHERE id IN (?);", recipesIDs)
	if err != nil {
		return nil, err
	}
	query = r.DB.Rebind(query)

	var recipes []recipeInDB
	if err := r.DB.Select(&recipes, query, args...); err != nil {
		return nil, err
	}

	ingredients := make(map[string]*grocery.Ingredient)
	for _, v := range recipes {
		var rawIngredients []*grocery.Ingredient
		if err := json.Unmarshal(v.IngredientsPerPortion, &rawIngredients); err != nil {
			return nil, err
		}

		for _, recipe := range rawIngredients {
			if _, ok := ingredients[recipe.ProductID]; ok {
				ingredients[recipe.ProductID].Quantity += recipe.Quantity * portions[v.ID]
				continue
			}

			ingredients[recipe.ProductID] = &grocery.Ingredient{
				ProductID: recipe.ProductID,
				Quantity:  recipe.Quantity * portions[v.ID],
			}
		}
	}

	leftovers, err := r.GetLeftovers(userID)
	if err != nil {
		return nil, err
	}

	var ingredientsToBuy []*grocery.Ingredient
	for _, v := range ingredients {
		quantity := v.Quantity
		atHome, ok := leftovers[v.ProductID]
		if ok && atHome > 0 {
			quantity = quantity - atHome
		}
		if quantity > 0 {
			ingredientsToBuy = append(ingredientsToBuy, &grocery.Ingredient{
				ProductID: v.ProductID,
				Quantity:  quantity,
			})
		}
	}

	return ingredientsToBuy, nil
}

// GetLeftovers returns leftovers
func (r *Service) GetLeftovers(userID int) (map[string]int, error) {
	var raw []*grocery.Ingredient
	err := r.DB.Select(&raw, `SELECT product_id, quantity FROM leftovers 
		WHERE user_id=$1;`, userID)
	if err != nil {
		return nil, errors.Wrap(err, "can't get leftovers")
	}

	lefovers := make(map[string]int)
	for _, v := range raw {
		lefovers[v.ProductID] = v.Quantity
	}

	return lefovers, nil
}

// GetCart returns cart
func (r *Service) GetCart(ingredients []*grocery.Ingredient) (grocery.Cart, error) {

	var productIDs []string
	quantities := make(map[string]int)
	for _, v := range ingredients {
		productIDs = append(productIDs, v.ProductID)
		quantities[v.ProductID] = v.Quantity
	}

	query, args, err := sqlx.In(`SELECT DISTINCT ON (product_id) * FROM rewe_products
		WHERE product_id IN (?);`, productIDs)
	if err != nil {
		return nil, err
	}
	query = r.DB.Rebind(query)

	var ShopProducts []grocery.ShopProduct
	if err := r.DB.Select(&ShopProducts, query, args...); err != nil {
		return nil, err
	}

	var cart grocery.Cart
	for _, rewe := range ShopProducts {
		var quantity int
		if rewe.Quantity > quantities[rewe.ProductID] {
			quantity = 1
		} else {
			quantity = quantities[rewe.ProductID] / rewe.Quantity
			if float64(quantities[rewe.ProductID]-rewe.Quantity*quantity) > 0.26*float64(quantities[rewe.ProductID]) {
				quantity++
			}
		}
		cart = append(cart, &grocery.CartItem{
			ShopItemID: rewe.ID,
			Quantity:   quantity,
		})
	}
	return cart, nil
}
