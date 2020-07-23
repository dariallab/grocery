package admin

import (
	"net/http"
	"time"

	"github.com/dariallab/grocery"
	"github.com/dariallab/grocery/pkg/platform/web"
	"github.com/dariallab/grocery/pkg/product"
	log "github.com/sirupsen/logrus"
)

const (
	templateProducts      = "products"
	templateShopProducts  = "rewe-products"
	typeUpdateShopProduct = "rewe-products"
)

type templateShopProductsData struct {
	ShopProducts []*grocery.ShopProduct
	ProductIDs   []string
	Page         string
	Now          time.Time
}
type templateProductsData struct {
	Products []*grocery.Product
	Page     string
	Now      time.Time
}

// ShopProducts shows all rewe-products
func ShopProducts(service *product.Service, l *log.Logger) http.HandlerFunc {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		t, err := getTemplate(templateShopProducts)
		if err != nil {
			l.Error(err)
			web.WriteErrorResponse(w, err)
			return
		}

		ShopProducts, err := service.GetShopProducts()
		if err != nil {
			l.Error(err)
			web.WriteErrorResponse(w, err)
			return
		}

		products, err := service.GetProducts()
		if err != nil {
			l.Error(err)
			web.WriteErrorResponse(w, err)
			return
		}
		var ids []string
		for _, v := range products {
			ids = append(ids, v.ID)
		}

		data := &templateShopProductsData{
			ShopProducts: ShopProducts,
			ProductIDs:   ids,
			Now:          time.Now(),
		}

		render(w, t, templateShopProducts, data, l)
	})
}

// Products shows all products
func Products(service *product.Service, l *log.Logger) http.HandlerFunc {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		t, err := getTemplate(templateProducts)
		if err != nil {
			l.Error(err)
			web.WriteErrorResponse(w, err)
			return
		}

		products, err := service.GetProducts()
		if err != nil {
			l.Error(err)
			web.WriteErrorResponse(w, err)
			return
		}

		data := &templateProductsData{
			Products: products,
			Now:      time.Now(),
		}

		render(w, t, templateProducts, data, l)
	})
}

// SaveShopProduct shows all rewe-products
func SaveShopProduct(service *product.Service, l *log.Logger) http.HandlerFunc {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		if err := r.ParseForm(); err != nil {
			l.Error(err)
			web.WriteErrorResponse(w, err)
			return
		}

		if err := service.UpdateShopProduct(r.Form.Get("reweID"), r.Form.Get("productID")); err != nil {
			l.Error(err)
			web.WriteErrorResponse(w, err)
			return
		}

		web.WriteSuccessResponse(w, http.StatusOK, "ok", typeUpdateShopProduct)
	})
}
