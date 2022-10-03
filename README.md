# Nexu Exercise API
**RESTful API using `rails api`.**

***

**Api Documentation:**

[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/1a9b61b61f552c91f03f?action=collection%2Fimport#?env%5BNexus%5D=W3sia2V5IjoiYmFzZV91cmxfZGV2IiwidmFsdWUiOiJsb2NhbGhvc3Q6MzAwMCIsImVuYWJsZWQiOnRydWUsInR5cGUiOiJkZWZhdWx0Iiwic2Vzc2lvblZhbHVlIjoibG9jYWxob3N0OjMwMDAiLCJzZXNzaW9uSW5kZXgiOjB9LHsia2V5IjoiYmFzZV91cmxfcHJvZCIsInZhbHVlIjoiaHR0cDovLzU0LjE0OS4xMzMuMjMyOjMwMDAiLCJlbmFibGVkIjp0cnVlLCJ0eXBlIjoiZGVmYXVsdCIsInNlc3Npb25WYWx1ZSI6Imh0dHA6Ly81NC4xNDkuMTMzLjIzMjozMDAwIiwic2Vzc2lvbkluZGV4IjoxfV0=)

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

## Bonus:
### you can test the application in this url
- base url: http://54.149.133.232:3000/
