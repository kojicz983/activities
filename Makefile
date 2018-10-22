init:
	docker-compose build          &&\
	docker-compose up -d postgres &&\
	sh ./wait-for-postgres.sh     &&\
	docker-compose up -d

clean:
	docker-compose kill;                      \
	docker-compose down -v --remove-orphans; \
	exit 0

boot: clean init migrations superuser
	google-chrome http://0.0.0.0:8000/ &&\
	$(MAKE) logs

migrations:
	docker-compose exec service bash -c "python manage.py makemigrations && python manage.py migrate"

## Reset super user
superuser:
	docker-compose exec service python manage.py shell -c "\
	from django.contrib.auth.models import User; \
	User.objects.create_superuser('admin', 'admin@example.com', 'password123');"

logs:
	docker-compose logs -f