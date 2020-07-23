package user

import (
	"github.com/dariallab/grocery"
	"github.com/dariallab/grocery/pkg/platform/postgres"
)

// Service implements
type Service struct {
	DB *postgres.DB
}

// GetUsers returns users
func (r *Service) GetUsers() ([]*grocery.User, error) {
	var users []*grocery.User
	err := r.DB.Select(&users, `SELECT * FROM users;`)
	if err != nil {
		return nil, err
	}

	return users, nil
}
