# Nexu Exercise API
**RESTful API using `rails api`.**

***

**Api Documentation:**

[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/1a9b61b61f552c91f03f?action=collection%2Fimport)

## pre-requisites:
- ruby (v3.1.2)
- bundler (v2.3.22)

## running
### 1. download the dependencies
```bash
$ bundle install --path=vendor
```

### 2. run pending migrations
```bash
$ bundle exec rails db:migrate
```

### 3. populate the database with the included models.json file
```bash
$ bundle exec rails db:seed
```

### 3. start the app
```bash
$ bundle exec rails server
```
