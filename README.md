# bonde-payments

## Pendings

- [ ] Create Dockerfile
- [ ] Create .drone.yml
- [ ] Create Rake Tasks

## Running tasks
`ruby -I . -r "app/main" -e "Main.new.sync_recipients 'STATUS'"`

## Avaliable Status

- available
- transferred
- waiting_funds