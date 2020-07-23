package postgres

import (
	"fmt"

	"github.com/jmoiron/sqlx"
)

// DB represents db
type DB struct {
	*sqlx.DB
}

// NewConnection is
func NewConnection(user, pass, host, dbName string) (*DB, error) {
	dsn := fmt.Sprintf("postgresql://%s:%s@%s/%s?sslmode=disable", user, pass, host, dbName)
	db, err := sqlx.Connect("postgres", dsn)
	if err != nil {
		return nil, err
	}

	return &DB{db}, nil
}
