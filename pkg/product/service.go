package product

import (
	"bytes"
	"encoding/json"

	"github.com/dariallab/grocery"
	"github.com/dariallab/grocery/pkg/platform/postgres"
)

// Service  implements methods for managing products
type Service struct {
	DB *postgres.DB
}

// DBProduct represents products data
type DBProduct struct {
	ID          string          `db:"id"`
	MinQuantity int             `db:"min_quantity"`
	Tags        json.RawMessage `db:"tags"`
}

// GetShopProducts returns products
func (r *Service) GetShopProducts() ([]*grocery.ShopProduct, error) {
	var products []*grocery.ShopProduct
	err := r.DB.Select(&products, `SELECT * FROM rewe_products;`)
	if err != nil {
		return nil, err
	}

	return products, nil
}

// InsertShopProduct adds new product
func (r *Service) InsertShopProduct(data *grocery.ShopProduct) error {
	_, err := r.DB.Exec(`INSERT INTO rewe_products (
				id,
				product_id,
			  	name,
				price,
				quantity,
				link,
				image
				) VALUES ($1, $2, $3, $4, $5, $6, $7)
				ON CONFLICT (id) DO UPDATE 
					SET
						product_id = EXCLUDED.product_id,
						name = EXCLUDED.name,
						price = EXCLUDED.price,
						quantity = EXCLUDED.quantity,
						link = EXCLUDED.link,
						image = EXCLUDED.image;`,
		data.ID,
		data.ProductID,
		data.Name,
		data.Price,
		data.Quantity,
		data.Link,
		data.Image,
	)

	return err
}

// UpdateShopProduct updates product data
func (r *Service) UpdateShopProduct(reweID, productID string) error {
	_, err := r.DB.Exec(`UPDATE rewe_products
					SET product_id=$1
					WHERE id=$2;`,
		productID,
		reweID,
	)
	return err
}

// GetProducts returns products
func (r *Service) GetProducts() ([]*grocery.Product, error) {
	var raw []*DBProduct
	err := r.DB.Select(&raw, `SELECT * FROM products;`)
	if err != nil {
		return nil, err
	}

	var products []*grocery.Product
	for _, v := range raw {
		var tags []string
		if err := json.NewDecoder(bytes.NewReader(v.Tags)).Decode(&tags); err != nil {
			return nil, err
		}

		products = append(products, &grocery.Product{
			ID:          v.ID,
			MinQuantity: v.MinQuantity,
			Tags:        tags,
		})
	}
	return products, nil
}
