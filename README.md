# grocery

## Descripiton

The `grocery` saves your time. It provides a way to automatically create a list for grocery (considering leftovers and meal schedule). It's a backend system plus chrome extension, that allows to add to the basket products from AmazonFresh in one click. [Video-overview](https://youtu.be/UrVnOiF56j0)


## Local development

### To run
1. `make setup` - run once to check that you have all dependencies for local development
Make sure that environment variables `$GOPATH` and `$GOROOT` are set, and `bin` folders are under $PATH `export PATH=$PATH:$GOPATH/bin` `export PATH=$PATH:$GOROOT/bin`
2. generate tls certificates `.assets/tls/cert.pem` and `.assets/tls/key.pem`. 
`go run $GOROOT/src/crypto/tls/generate_cert.go --rsa-bits 1024 --host 127.0.0.1,::1,localhost --ca --start-date "Jan 1 00:00:00 1970" --duration=1000000h && mv *.pem .assets/tls/`
3. `make up` - for running api, check https://127.0.0.1/ for api and https://127.0.0.1/docs for documentation. 


### To test 
1. `make test` - for running unit tests
2. `make test-integration` - for running all tests, including integration tests
3. `make check` - for runing before commit - it will run all checkings/tests/api to make sure that every commit leaves repo in stable state

### To add new api endpoint
1. Besides adding route (in main.go) and code+tests inside proper package in `/pkg`, use
`// swagger:route` 
`// swagger:parameters`
`// swagger:response` to generate documentation
2. `make up` will apply changes, so no need in manual run
3. But if you want, you can do it manually by
`make docs`

### To do changes in DB structure:
1. Create new migration file 
`goose -dir=.assets/migrations/  create migration_name sql`
2. `make up` checks that all migrations are applied, so no need in manual running of migration
3. But if you need to rollback you can use `down` command
`goose -dir=.assets/migrations/  postgres "postgresql://user:pass@127.0.0.1:5432/grocery?sslmode=disable" down`
4. You also can usee `status` and `up` command for manual handling
`goose -dir=.assets/migrations/  postgres "postgresql://user:pass@127.0.0.1:5432/grocery?sslmode=disable" status`
`goose -dir=.assets/migrations/  postgres "postgresql://user:pass@127.0.0.1:5432/grocery?sslmode=disable" up`