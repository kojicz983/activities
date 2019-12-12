.PHONY: init clean boot findgeo logs dump


DATABASE_NAME := activities
SQL_NAME := $(shell date +%d.%m.%Y_%H.%M)
SQL_PATH := sql/activities_$(SQL_NAME).sql.gz

## Initialize project
init:
	docker-compose build
	docker-compose up -d database
	docker-compose exec database sh -c 'until $$(nc -z localhost 5432); do { printf '.'; sleep 1; }; done'
	docker-compose up -d

## Delete all
clean:
	docker-compose kill;                     \
	docker-compose down -v --remove-orphans; \
	exit 0

## Boot project
boot: clean init
	google-chrome http://0.0.0.0:8300/ &&\
	$(MAKE) logs

## Find geo locations
findgeo:
	docker-compose exec service python manage.py findgeo

logs:
	docker-compose logs -f

## Dump database
dump:
	docker-compose exec database pg_dump -h localhost -U postgres ${DATABASE_NAME} | gzip > ${SQL_PATH}
