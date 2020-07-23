package config

import (
	"github.com/kelseyhightower/envconfig"
)

// Env represents config with variables needed for an app
type Env struct {
	Port     int    `envconfig:"PORT" required:"true"`
	LogLevel string `envconfig:"LOG_LEVEL" default:"info"`
	DB       DB
}

// DB is
type DB struct {
	Host     string `envconfig:"DB_HOST" required:"true"`
	User     string `envconfig:"DB_USER" required:"true"`
	Password string `envconfig:"DB_PASSWORD" required:"true"`
	Name     string `envconfig:"DB_NAME" required:"true"`
}

// Get returns config, filled from environment variables
func Get() (*Env, error) {
	var env Env
	if err := envconfig.Process("", &env); err != nil {
		return nil, err
	}
	return &env, nil
}
