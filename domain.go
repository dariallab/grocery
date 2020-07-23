package grocery

import "time"

// User respresents data that stored for each user
type User struct {
	ID int `db:"id"`
}

// Schedule contains all products that user should order for one week
type Schedule struct {
	UserID   int       `db:"user_id"`
	FromDate time.Time `db:"from_date"`
	ToDate   time.Time `db:"to_date"`
	Menu     Menu      `db:"menu"`
}

// Menu represents list of recipes
type Menu []*MenuItem

// MenuItem represents data for menu
type MenuItem struct {
	RecipeID string `db:"recipe_id"`
	Portion  int    `db:"portion"`
}

// Recipe  represents recipe data
type Recipe struct {
	ID                    string
	UserID                int
	IngredientsPerPortion []*Ingredient
}

// Ingredient represents ingredients data
type Ingredient struct {
	ProductID string `db:"product_id"`
	Quantity  int    `db:"quantity"`
}

// ShopProduct represents product data from the shop
type ShopProduct struct {
	ID        string `db:"id" json:"id"`
	ProductID string `db:"product_id" json:"product_id"`
	Name      string `db:"name" json:"name"`
	Price     int    `db:"price" json:"price"`
	Quantity  int    `db:"quantity" json:"quantity"`
	Link      string `db:"link" json:"link"`
	Image     string `db:"image" json:"image"`
}

// Product represents product data
type Product struct {
	ID          string   `db:"id"`
	MinQuantity int      `db:"min_quantity"`
	Tags        []string `db:"tags"`
}

// Cart is list of products to buy for a week
type Cart []*CartItem

// CartItem represents cart item data
type CartItem struct {
	ShopItemID string `json:"listingId"`
	Quantity   int    `json:"quantity"`
}

// Leftover represents leftover data
type Leftover struct {
	UserID    int    `db:"user_id"`
	ProductID string `db:"product_id"`
	Quantity  int    `db:"quantity"`
}

// Service represents methods for managing the data
type Service interface {
	GetMenu(userID int, weekID int) (Menu, error)
	GetShopProducts() ([]*ShopProduct, error)
	InsertShopProduct(data *ShopProduct) error
	GetIngredients(userID int, menu Menu) ([]*Ingredient, error)
	GetCart(ingredients []*Ingredient) (Cart, error)
}
