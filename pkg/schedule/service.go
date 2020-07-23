package schedule

import (
	"encoding/json"
	"time"

	"github.com/dariallab/grocery"
	"github.com/dariallab/grocery/pkg/platform/postgres"
)

// Service implements methods for managing schedule
type Service struct {
	DB *postgres.DB
}

// Schedule represents data for schedule
type Schedule struct {
	UserID   int             `db:"user_id"`
	FromDate time.Time       `db:"from_date"`
	ToDate   time.Time       `db:"to_date"`
	Menu     json.RawMessage `db:"menu"`
}

// GetSchedules returns schedule
func (r *Service) GetSchedules(userID int) ([]*grocery.Schedule, error) {
	var recipesRaw []*Schedule
	err := r.DB.Select(&recipesRaw, `SELECT * FROM schedules WHERE user_id=$1;`, userID)
	if err != nil {
		return nil, err
	}

	var schedules []*grocery.Schedule
	for _, v := range recipesRaw {
		var menu grocery.Menu
		if err := json.Unmarshal(v.Menu, &menu); err != nil {
			return nil, err
		}
		schedules = append(schedules, &grocery.Schedule{
			UserID:   v.UserID,
			FromDate: v.FromDate,
			ToDate:   v.ToDate,
			Menu:     menu,
		})
	}

	return schedules, nil
}

// CreateSchedule creates new schedule
func (r *Service) CreateSchedule(schedule *grocery.Schedule) error {
	menu, err := json.Marshal(schedule.Menu)
	if err != nil {
		return err
	}
	if _, err := r.DB.NamedExec(`INSERT INTO schedules (user_id,menu,from_date,to_date) 
			VALUES (:user_id,:menu,:from_date;to_date)
			ON CONFLICT ON CONSTRAINT unique_hospital_id_medical_case_id DO NOTHING`,
		map[string]interface{}{
			"user_id":   schedule.UserID,
			"menu":      menu,
			"from_date": time.Now(),
			"to_date":   time.Now().Add(7 * 24 * time.Hour),
		}); err != nil {
		return err
	}

	return nil
}
