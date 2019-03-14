.PHONY: init clean boot migrations superuser sdgs topics categories import-data findgeo logs dump

## Initialize project
init:
	docker-compose up -d

clean:
	docker-compose kill;                     \
	docker-compose down -v --remove-orphans; \
	exit 0

boot: clean init migrations superuser sdgs topics categories import-data findgeo
	google-chrome http://0.0.0.0/ &&\
	$(MAKE) logs

migrations:
	docker-compose exec app bash -c "python manage.py makemigrations && python manage.py migrate"

## Reset super user
superuser:
	docker-compose exec app python manage.py shell -c "\
	from django.contrib.auth.models import User; \
	User.objects.create_superuser('admin', 'admin@example.com', 'password123');"

## SDG
sdgs:
	docker-compose exec app python manage.py shell -c "\
	from activities.models import SDG; \
	SDG.objects.create(name='GOAL 1: No Poverty'); \
	SDG.objects.create(name='GOAL 2: Zero Hunger'); \
	SDG.objects.create(name='GOAL 3: Good Health and Well-being'); \
	SDG.objects.create(name='GOAL 4: Quality Education'); \
	SDG.objects.create(name='GOAL 5: Gender Equality'); \
	SDG.objects.create(name='GOAL 6: Clean Water and Sanitation'); \
	SDG.objects.create(name='GOAL 7: Affordable and Clean Energy'); \
	SDG.objects.create(name='GOAL 8: Decent Work and Economic Growth'); \
	SDG.objects.create(name='GOAL 9: Industry, Innovation and Infrastructure'); \
	SDG.objects.create(name='GOAL 10: Reduced Inequality'); \
	SDG.objects.create(name='GOAL 11: Sustainable Cities and Communities'); \
	SDG.objects.create(name='GOAL 12: Responsible Consumption and Production'); \
	SDG.objects.create(name='GOAL 13: Climate Action'); \
	SDG.objects.create(name='GOAL 14: Life Below Water'); \
	SDG.objects.create(name='GOAL 15: Life on Land'); \
	SDG.objects.create(name='GOAL 16: Peace and Justice Strong Institutions'); \
	SDG.objects.create(name='GOAL 17: Partnerships to achieve the Goal');"

## topics
topics:
	docker-compose exec app python manage.py shell -c "\
	from activities.models import Topic; \
	Topic.objects.create(name='Poverty Reduction'); \
	Topic.objects.create(name='E-Governance'); \
	Topic.objects.create(name='Parliamentary Development'); \
	Topic.objects.create(name='Public Finance Management'); \
	Topic.objects.create(name='Vulnerable groups'); \
	Topic.objects.create(name='Gender Equality'); \
	Topic.objects.create(name='Energy Efficiency and Renewable Energy'); \
	Topic.objects.create(name='Climate Change'); \
	Topic.objects.create(name='Environment'); \
	Topic.objects.create(name='Local Municipal Resilience and Disaster Risk Reduction');"

## categories
categories:
	docker-compose exec app python manage.py shell -c "\
	from activities.models import Category; \
	Category.objects.create(name='Technical Documentation'); \
	Category.objects.create(name='Research'); \
	Category.objects.create(name='Infrastructure works'); \
	Category.objects.create(name='Employment'); \
	Category.objects.create(name='Private Sector support'); \
	Category.objects.create(name='Institution Building'); \
	Category.objects.create(name='Capacity development'); \
	Category.objects.create(name='Expert support'); \
	Category.objects.create(name='Normative support'); \
	Category.objects.create(name='Innovative solutions'); \
	Category.objects.create(name='Equipment');"

## Import data
import-data:
	docker-compose exec app python manage.py import

## Find geo locations
findgeo:
	docker-compose exec app python manage.py findgeo

logs:
	docker-compose logs -f