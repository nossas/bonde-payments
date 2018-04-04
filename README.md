# bonde-payments

## Pendings

- [x] Create Dockerfile
- [x] Create .drone.yml
- [ ] Create Rake Tasks
- [ ] Create log with timeout balances

## ENVs
> DATABASE_URL      # Database URL
> RUBY_ENV          # ENVIRONMENT { staging, develop, production }
> PAGARME_API_KEY   # PagarME access key
> AMOUNT            # Amount of balance per page

## Running tasks with Ruby
TRUBY_ENV=ENVIRONMENT AMOUNT=100 DATABASE_URL='postgres://postgres@localhost/postgres' ruby -I . -r "app/main" -e "Main.new.sync_recipients 'STATUS'"`
=======
- [ ] Create .drone.yml
- [ ] Create Rake Tasks

## Running tasks with Ruby
`RUBY_ENV=ENVIRONMENT DATABASE_URL='postgres://postgres@localhost/postgres' ruby -I . -r "app/main" -e "Main.new.sync_recipients 'STATUS'"`

## Running tasks on Docker
```
docker run -t --net host --env RUBY_ENV=environment --env PAGARME_API_KEY=pagarme_api_key --env DATABASE_URL='postgres://postgres@localhost/postgres' bonde/payments ruby -I . -r "app/main" -e "Main.new.sync_recipients 'STATUS'"
```

## Building a docker image
`docker build -f Dockerfile -t bonde/payments .`

## Avaliable Status

- available
- transferred
- waiting_funds
