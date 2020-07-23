-- +goose Up
-- SQL in this section is executed when the migration is applied.
CREATE TABLE users (
                id SERIAL PRIMARY KEY
);

CREATE TABLE products (
                id VARCHAR(255) PRIMARY KEY,
                tags JSONB NOT NULL, 
                min_quantity smallint NOT NULL
);

CREATE TABLE rewe_products (
                id VARCHAR(255) PRIMARY KEY,
                product_id VARCHAR(255) NOT NULL REFERENCES products (id),
                name VARCHAR(255) NOT NULL,
                price smallint NOT NULL,
                quantity smallint NOT NULL,
                link VARCHAR(255) NOT NULL,
                image VARCHAR(255) NOT NULL
);

CREATE TABLE recipes (
                id VARCHAR(255) PRIMARY KEY,
                user_id integer NOT NULL REFERENCES users (id),
                ingredients_per_portion JSONB NOT NULL
);

CREATE TABLE leftovers (
                user_id integer NOT NULL REFERENCES users (id),
                product_id VARCHAR(255) NOT NULL REFERENCES products (id),
                quantity smallint NOT NULL
);

CREATE TABLE schedules (
                user_id integer NOT NULL REFERENCES users (id),
                week_id integer NOT NULL,
                menu JSONB NOT NULL
);

-- +goose Down
-- SQL in this section is executed when the migration is rolled back.
DROP TABLE schedules CASCADE;
DROP TABLE leftovers CASCADE;
DROP TABLE recipes CASCADE;
DROP TABLE rewe_products CASCADE;
DROP TABLE products CASCADE;
DROP TABLE users CASCADE;