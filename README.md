# administrate-bug-repro

Minimal reproduction case for [a bug report](https://github.com/thoughtbot/administrate/issues/2088) in Administrate.

# Reproduction Notes

- `bundle install`
- `bundle exec rails db:create db:migrate db:seed`
- `bundle exec rails server`
- Visit http://localhost:3000/admin
- Confirm queries from rails log:
  ```
  User Load (0.1ms)  SELECT "users".* FROM "users" LIMIT ? OFFSET ?  [["LIMIT", 20], ["OFFSET", 0]]
  Message Load (19.3ms)  SELECT "messages".* FROM "messages" WHERE "messages"."user_id" = ?  [["user_id", 1]]
  ```

Seeds are re-entrant, `rails db:seed` can be re-run to add another ten
thousand messages at a time, to demonstrate the slow-down in request time
even on a purposefully minimal model.
