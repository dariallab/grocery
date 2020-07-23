package status

import (
	"net/http"
)

// Info returns api's info
func Info() http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		if _, err := w.Write([]byte("grocery api")); err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
		}
	}
}
