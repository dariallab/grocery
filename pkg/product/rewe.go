package product

import (
	"encoding/json"
	"io"
	"net/http"

	"github.com/dariallab/grocery"
	"github.com/dariallab/grocery/pkg/platform/errors"
	log "github.com/sirupsen/logrus"
)

// GetShopProducts returns products data from the shop
func GetShopProducts(service *Service, l *log.Logger) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		products, err := service.GetShopProducts()
		if err != nil {
			err = errors.Wrap(err, "can't get rewe products")
			l.Error(err)
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}

		response, err := json.Marshal(products)
		if err != nil {
			err = errors.Wrap(err, "can't marshal rewe products")
			l.Error(err)
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}

		if _, err := w.Write(response); err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}
	}
}

// InsertShopProducts adds new product
func InsertShopProducts(service *Service, l *log.Logger) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		data, err := getShopProductPayload(r.Body)
		if err != nil {
			err = errors.Wrap(err, "can't get rewe products payload")
			l.Error(err)
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}

		if err := service.InsertShopProduct(data); err != nil {
			err = errors.Wrap(err, "can't insert rewe products")
			l.Error(err)
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}

		response, err := json.Marshal("ok")
		if err != nil {
			err = errors.Wrap(err, "can't marshal insert rewe products response")
			l.Error(err)
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}

		if _, err := w.Write(response); err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}
	}
}

func getShopProductPayload(body io.Reader) (*grocery.ShopProduct, error) {
	var payload grocery.ShopProduct
	if err := json.NewDecoder(body).Decode(&payload); err != nil {
		return nil, errors.New(errors.EINVALID, "invalid payload", "", err)
	}
	return &payload, nil
}
