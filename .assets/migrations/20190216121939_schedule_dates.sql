-- +goose Up
-- SQL in this section is executed when the migration is applied.
ALTER TABLE schedules
    ADD COLUMN "from_date" DATE,
    ADD COLUMN "to_date" DATE,
    DROP COLUMN "week_id",
    ADD CONSTRAINT "user_id_from_date" UNIQUE ("user_id", "from_date");

-- +goose Down
-- SQL in this section is executed when the migration is rolled back.
ALTER TABLE schedules
    DROP COLUMN "from_date",
    DROP COLUMN "to_date",
    ADD COLUMN "week_id" INTEGER,
    DROP CONSTRAINT "user_id_from_date";

