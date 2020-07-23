package admin

import (
	"net/http"
	"time"

	"github.com/dariallab/grocery"
	"github.com/dariallab/grocery/pkg/platform/web"
	"github.com/dariallab/grocery/pkg/recipe"
	log "github.com/sirupsen/logrus"
)

const (
	templateRecipes = "recipes"
)

type templateRecipesData struct {
	Recipes []*grocery.Recipe
	Page    string
	Now     time.Time
}

// Recipes returns recipes
func Recipes(service *recipe.Service, l *log.Logger) http.HandlerFunc {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		t, err := getTemplate(templateRecipes)
		if err != nil {
			l.Error(err)
			web.WriteErrorResponse(w, err)
			return
		}

		// todo use real user
		userID := 1
		recipes, err := service.GetRecipes(userID)
		if err != nil {
			l.Error(err)
			web.WriteErrorResponse(w, err)
			return
		}

		data := &templateRecipesData{
			Recipes: recipes,
			Page:    templateRecipes,
			Now:     time.Now(),
		}

		render(w, t, templateRecipes, data, l)
	})
}
