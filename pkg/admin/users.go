package admin

import (
	"net/http"
	"time"

	"github.com/dariallab/grocery"
	"github.com/dariallab/grocery/pkg/platform/web"
	"github.com/dariallab/grocery/pkg/user"
	log "github.com/sirupsen/logrus"
)

const (
	templateUsers = "users"
)

type templateUsersData struct {
	Users []*grocery.User
	Page  string
	Now   time.Time
}

// Users returns users data
func Users(service *user.Service, l *log.Logger) http.HandlerFunc {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		t, err := getTemplate(templateUsers)
		if err != nil {
			l.Error(err)
			web.WriteErrorResponse(w, err)
			return
		}

		users, err := service.GetUsers()
		if err != nil {
			l.Error(err)
			web.WriteErrorResponse(w, err)
			return
		}

		data := &templateUsersData{
			Users: users,
			Page:  templateUsers,
			Now:   time.Now(),
		}

		render(w, t, templateUsers, data, l)
	})
}
