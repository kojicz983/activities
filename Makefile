init:
	docker-compose build          &&\
	docker-compose up -d postgres &&\
	sh ./wait-for-postgres.sh     &&\
	docker-compose up -d

clean:
	docker-compose kill;                      \
	docker-compose down -v --remove-orphans; \
	exit 0

boot: clean init
	google-chrome http://0.0.0.0:8000/ &&\
	$(MAKE) logs

logs:
	docker-compose logs -f