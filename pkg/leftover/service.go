package leftover

import (
	"github.com/dariallab/grocery"
	"github.com/dariallab/grocery/pkg/platform/postgres"
)

// Service implements methods for managing leftobers
type Service struct {
	*postgres.DB
}

// GetLeftovers returns leftover information
func (r *Service) GetLeftovers(userID int) ([]*grocery.Leftover, error) {
	var leftovers []*grocery.Leftover
	err := r.Select(&leftovers, `SELECT * FROM leftovers WHERE user_id=$1;`, userID)
	if err != nil {
		return nil, err
	}

	return leftovers, nil
}
