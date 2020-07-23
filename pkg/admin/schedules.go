package admin

import (
	"net/http"
	"time"

	"github.com/dariallab/grocery"
	"github.com/dariallab/grocery/pkg/platform/web"
	"github.com/dariallab/grocery/pkg/schedule"
	"github.com/gorilla/schema"
	log "github.com/sirupsen/logrus"
)

const (
	templateSchedules    = "schedules"
	templateShowSchedule = "schedule"
)

type templateSchedulesData struct {
	Schedules []*grocery.Schedule
	Page      string
	Now       time.Time
}
type templateShowScheduleData struct {
	Schedule *grocery.Schedule
	Recipes  []*grocery.Recipe
	Page     string
	Now      time.Time
}

// ScheduleForm represent form data for schedule
type ScheduleForm struct {
	UserID    string
	FromDate  string
	ToDate    string
	Portions  []int
	RecipeIDs []int
}

// Schedules returns schedule
func Schedules(service *schedule.Service, l *log.Logger) http.HandlerFunc {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		t, err := getTemplate(templateSchedules)
		if err != nil {
			l.Error(err)
			web.WriteErrorResponse(w, err)
			return
		}

		// todo use real user
		userID := 1
		schedules, err := service.GetSchedules(userID)
		if err != nil {
			l.Error(err)
			web.WriteErrorResponse(w, err)
			return
		}

		data := &templateSchedulesData{
			Schedules: schedules,
			Page:      templateSchedules,
			Now:       time.Now(),
		}

		render(w, t, templateSchedules, data, l)
	})
}

// ShowSchedule rerund data for the schedule
func ShowSchedule(service *schedule.Service, l *log.Logger) http.HandlerFunc {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		t, err := getTemplate(templateShowSchedule)
		if err != nil {
			l.Error(err)
			web.WriteErrorResponse(w, err)
			return
		}

		// todo use real user
		// userID := 1
		// schedules, err := service.GetSchedule(userID, date)
		// if err != nil {
		// 	l.Error(err)
		// 	web.WriteErrorResponse(w, err)
		// 	return
		// }

		data := &templateShowScheduleData{
			Schedule: &grocery.Schedule{
				UserID:   1,
				FromDate: time.Now(),
				ToDate:   time.Now().Add(7 * 24 * time.Hour),
			},
			Recipes: []*grocery.Recipe{
				{ID: "breakfast-blueberry"},
				{ID: "10-salmon-vegetables"},
			},
			Page: templateSchedules,
			Now:  time.Now(),
		}

		render(w, t, templateShowSchedule, data, l)
	})
}

// SaveSchedule saves schedule information
func SaveSchedule(service *schedule.Service, l *log.Logger) http.HandlerFunc {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		if err := r.ParseForm(); err != nil {
			l.Error(err)
			web.WriteErrorResponse(w, err)
			return
		}
		var f ScheduleForm
		if err := schema.NewDecoder().Decode(&f, r.PostForm); err != nil {
			l.Error(err)
			web.WriteErrorResponse(w, err)
			return
		}

		t, err := getTemplate(templateSchedules)
		if err != nil {
			l.Error(err)
			web.WriteErrorResponse(w, err)
			return
		}

		// todo use real user
		userID := 1
		schedules, err := service.GetSchedules(userID)
		if err != nil {
			l.Error(err)
			web.WriteErrorResponse(w, err)
			return
		}

		data := &templateSchedulesData{
			Schedules: schedules,
			Page:      templateSchedules,
			Now:       time.Now(),
		}

		render(w, t, templateSchedules, data, l)
	})
}
