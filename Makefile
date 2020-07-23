SERVICE_NAME := grocery
PROJECT := github.com/dariallab/grocery
PKG := ${PROJECT}/cmd/${SERVICE_NAME}
PKG_LIST := $(shell go list ${PROJECT}/... | grep -v /vendor/)
BUILD_DIR := build
LDFLAGS := -ldflags "-X main.Commit=`git rev-parse HEAD` "

.PHONY: all lint test build up down db setup clean help 

all: help

lint: dep ## Run static analysis checks
	gofmt -w .
	golangci-lint run

test: dep ## Run unittests with race detector
	go test -race -short ${PKG_LIST}

test-integration:
	docker-compose -f docker-compose.test.yml up -d test-db
	goose -dir=.assets/migrations/  postgres "postgresql://user:pass@127.0.0.1:15432/test-grocery?sslmode=disable" up
	go test --tags=integration -race -short ${PKG_LIST}
			
build: docs ## Build the binary file
	packr
	go build -o ${BUILD_DIR}/${SERVICE_NAME} ${LDFLAGS} ${PKG}
	packr clean

dep:
	go mod tidy
	go mod vendor

up: dep docs ## Run api for local development
	docker-compose up -d db
	goose -dir=.assets/migrations/  postgres "postgresql://user:pass@127.0.0.1:5432/grocery?sslmode=disable" up
	docker-compose up --build api

down:  ## Shutdown api and clean local development
	docker-compose down --rmi local --volumes --remove-orphans

docs:
	swagger generate spec -o ./.assets/docs/swagger.json

setup: ## Contain commands for setting up local development
	go get -u github.com/pressly/goose/cmd/goose
	go get -u github.com/gobuffalo/packr/...
	go get -u github.com/go-swagger/go-swagger/cmd/swagger

check: docs lint test test-integration build up ## Checks before commit

clean: ## Remove generated files after build
	rm -rf ${BUILD_DIR}

help: ## Display this help screen
	@grep -h -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'