package admin

import (
	"net/http"
	"time"

	"github.com/dariallab/grocery"
	"github.com/dariallab/grocery/pkg/leftover"
	"github.com/dariallab/grocery/pkg/platform/web"
	log "github.com/sirupsen/logrus"
)

const (
	templateLeftovers = "leftovers"
)

type templateLeftoversData struct {
	Leftovers []*grocery.Leftover
	Page      string
	Now       time.Time
}

// Leftovers return leftovers
func Leftovers(service *leftover.Service, l *log.Logger) http.HandlerFunc {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		t, err := getTemplate(templateLeftovers)
		if err != nil {
			l.Error(err)
			web.WriteErrorResponse(w, err)
			return
		}

		// todo use real user
		userID := 1
		leftovers, err := service.GetLeftovers(userID)
		if err != nil {
			l.Error(err)
			web.WriteErrorResponse(w, err)
			return
		}

		data := &templateLeftoversData{
			Leftovers: leftovers,
			Page:      templateLeftovers,
			Now:       time.Now(),
		}

		render(w, t, templateLeftovers, data, l)
	})
}
