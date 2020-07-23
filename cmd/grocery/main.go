package main

import (
	"fmt"
	"net/http"

	"github.com/dariallab/grocery/pkg/admin"
	"github.com/dariallab/grocery/pkg/cart"
	"github.com/dariallab/grocery/pkg/leftover"
	"github.com/dariallab/grocery/pkg/platform/config"
	"github.com/dariallab/grocery/pkg/platform/logger"
	"github.com/dariallab/grocery/pkg/platform/postgres"
	"github.com/dariallab/grocery/pkg/product"
	"github.com/dariallab/grocery/pkg/recipe"
	"github.com/dariallab/grocery/pkg/schedule"
	"github.com/dariallab/grocery/pkg/status"
	"github.com/dariallab/grocery/pkg/user"
	"github.com/go-chi/chi"
	"github.com/go-chi/chi/middleware"
	"github.com/go-chi/cors"
	_ "github.com/lib/pq"
	log "github.com/sirupsen/logrus"
)

// App represents app's services
type App struct {
	log             *log.Logger
	productService  *product.Service
	recipeService   *recipe.Service
	leftoverService *leftover.Service
	scheduleService *schedule.Service
	userService     *user.Service
	cartService     *cart.Service
}

func main() {
	cfg, err := config.Get()
	if err != nil {
		log.Fatalf("can't get config: %s", err)
	}

	log, err := logger.Get(cfg.LogLevel)
	if err != nil {
		log.Fatalf("failed to create logger: %s", err)
	}

	db, err := postgres.NewConnection(cfg.DB.User, cfg.DB.Password, cfg.DB.Host, cfg.DB.Name)
	if err != nil {
		log.Fatal(err)
	}
	defer func() {
		if err := db.Close(); err != nil {
			log.Fatal(err)
		}
	}()

	app := &App{
		productService:  &product.Service{DB: db},
		leftoverService: &leftover.Service{DB: db},
		cartService:     &cart.Service{DB: db},
		recipeService:   &recipe.Service{DB: db},
		scheduleService: &schedule.Service{DB: db},
		userService:     &user.Service{DB: db},
		log:             log,
	}

	addr := fmt.Sprintf(":%v", cfg.Port)
	log.Infof("listen and serve on %s", addr)
	log.Fatal(http.ListenAndServe(addr, app.getRoutes(cfg)))
}

func (a *App) getRoutes(cfg *config.Env) *chi.Mux {
	r := chi.NewRouter()
	r.Use(CORSMiddleware())
	r.Use(middleware.Logger)
	r.Use(middleware.Recoverer)
	r.Use(middleware.RequestID)

	r.Get("/", status.Info())
	r.Get("/cart", cart.GetCart(a.cartService, a.log))
	r.Route("/rewe-products", func(r chi.Router) {
		r.Get("/", product.GetShopProducts(a.productService, a.log))
		r.Post("/", product.InsertShopProducts(a.productService, a.log))
	})
	r.Route("/admin", func(r chi.Router) {
		r.Get("/rewe-products", admin.ShopProducts(a.productService, a.log))
		r.Post("/rewe-product", admin.SaveShopProduct(a.productService, a.log))
		r.Get("/products", admin.Products(a.productService, a.log))
		r.Get("/leftovers", admin.Leftovers(a.leftoverService, a.log))
		r.Get("/recipes", admin.Recipes(a.recipeService, a.log))
		r.Get("/schedules", admin.Schedules(a.scheduleService, a.log))
		r.Get("/schedule", admin.ShowSchedule(a.scheduleService, a.log))
		r.Post("/schedule", admin.SaveSchedule(a.scheduleService, a.log))
		r.Get("/users", admin.Users(a.userService, a.log))
	})

	return r
}

// CORSMiddleware sets params for CORS
func CORSMiddleware() func(http.Handler) http.Handler {
	return cors.New(cors.Options{
		AllowedOrigins:   []string{"*"},
		AllowedMethods:   []string{"GET", "POST"},
		AllowedHeaders:   []string{"Accept", "Authorization", "Content-Type", "X-CSRF-Token"},
		ExposedHeaders:   []string{"Link"},
		AllowCredentials: true,
		MaxAge:           300,
	}).Handler
}
