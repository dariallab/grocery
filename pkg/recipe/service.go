package recipe

import (
	"encoding/json"

	"github.com/dariallab/grocery"
	"github.com/dariallab/grocery/pkg/platform/postgres"
)

// Service implements methods for managing recipe
type Service struct {
	DB *postgres.DB
}

// Recipe represents data for recipe
type Recipe struct {
	ID                    string          `db:"id"`
	UserID                int             `db:"user_id"`
	IngredientsPerPortion json.RawMessage `db:"ingredients_per_portion"`
}

// GetRecipes returnss recipes
func (r *Service) GetRecipes(userID int) ([]*grocery.Recipe, error) {
	var recipesRaw []*Recipe
	err := r.DB.Select(&recipesRaw, `SELECT * FROM recipes WHERE user_id=$1;`, userID)
	if err != nil {
		return nil, err
	}

	var recipes []*grocery.Recipe
	for _, v := range recipesRaw {
		var ingredients []*grocery.Ingredient
		if err := json.Unmarshal(v.IngredientsPerPortion, &ingredients); err != nil {
			return nil, err
		}
		recipes = append(recipes, &grocery.Recipe{
			ID:                    v.ID,
			UserID:                v.UserID,
			IngredientsPerPortion: ingredients,
		})
	}

	return recipes, nil
}
