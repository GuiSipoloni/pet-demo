# README

## Run Docker

Build docker image: `docker-compose build`

Setup database: `docker-compose run --rm web rake db:setup`

Run tests: `docker-compose run --rm web bundle exec rspec`

Questions: `docker-compose run --rm -e RACK_ENV=test web bundle exec rspec -fd spec/models/pet_spec.rb:51`
