all: schema-load data-load

schema-load:
	psql hexlet < schema.sql

data-load:
	psql hexlet < users.sql

generate:
	node ./bin/load.js

db-reset:
	dropdb hexlet
	createdb hexlet

db-create:
	createdb hexlet

dev-docker-build:
	docker build . -t pg-dump-example

dev-docker-init:
	docker rm pg-dump-example
	docker run --name pg-dump-example -v `pwd`:/pg-dump-example pg-dump-example

dev-docker-attach:
	docker exec -it -w /pg-dump-example -u postgres pg-dump-example bash
