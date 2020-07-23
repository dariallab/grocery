package logger

import (
	log "github.com/sirupsen/logrus"
)

// Get returns a new log instance
func Get(logLevel string) (*log.Logger, error) {
	l := log.New()
	l.Formatter = new(log.JSONFormatter)

	level, err := log.ParseLevel(logLevel)
	if err != nil {
		return nil, err
	}
	l.Infof("log level: %s", level.String())
	l.Level = level

	return l, nil
}
