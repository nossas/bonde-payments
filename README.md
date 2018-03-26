# bonde-payments

## Pendings

- [x] Create Dockerfile
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