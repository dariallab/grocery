package cart

import (
	"encoding/json"
	"net/http"

	"github.com/dariallab/grocery/pkg/platform/errors"
	log "github.com/sirupsen/logrus"
)

type cartRequest struct {
	UserID int `json:"user_id"`
}

// GetCart returns cart
func GetCart(service *Service, l *log.Logger) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		// todo real request
		var req cartRequest
		req.UserID = 1

		menu, err := service.GetMenu(req.UserID)
		if err != nil {
			err = errors.Wrap(err, "can't get menu")
			l.Error(err)
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}

		ingredients, err := service.GetIngredients(req.UserID, menu)
		if err != nil {
			err = errors.Wrap(err, "can't get ingredients")
			l.Error(err)
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}

		cart, err := service.GetCart(ingredients)
		if err != nil {
			err = errors.Wrap(err, "can't get cart")
			l.Error(err)
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}

		response, err := json.Marshal(cart)
		if err != nil {
			err = errors.Wrap(err, "can't marshal cart response")
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
