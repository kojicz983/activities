init:
	docker-compose build          &&\
	docker-compose up -d postgres &&\
	sh ./wait-for-postgres.sh     &&\
	docker-compose up -d

clean:
	docker-compose kill;                     \
	docker-compose down -v --remove-orphans; \
	exit 0

boot: clean init migrations superuser sdgs topics categories import-data
	google-chrome http://0.0.0.0:8000/ &&\
	$(MAKE) logs

migrations:
	docker-compose exec service bash -c "python manage.py makemigrations && python manage.py migrate"

## Reset super user
superuser:
	docker-compose exec service python manage.py shell -c "\
	from django.contrib.auth.models import User; \
	User.objects.create_superuser('admin', 'admin@example.com', 'password123');"

## SDG
sdgs:
	docker-compose exec service python manage.py shell -c "\
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
	docker-compose exec service python manage.py shell -c "\
	from activities.models import Topic; \
	Topic.objects.create(name='Poverty Reduction'); \
	Topic.objects.create(name='E-Governance'); \
	Topic.objects.create(name='Parliaments'); \
	Topic.objects.create(name='Public Finance Management'); \
	Topic.objects.create(name='Vulnerable groups'); \
	Topic.objects.create(name='Gender Equality'); \
	Topic.objects.create(name='Energy Efficiency and Renewable Energy'); \
	Topic.objects.create(name='Climate-change'); \
	Topic.objects.create(name='Environment'); \
	Topic.objects.create(name='Local Municipal Resilience and Disaster Risk Reduction');"

## categories
categories:
	docker-compose exec service python manage.py shell -c "\
	from activities.models import Category; \
	Category.objects.create(name='Technical Documentation'); \
	Category.objects.create(name='Research (Studies and Analysis)'); \
	Category.objects.create(name='Infrastructure works (e.g. sewage, CHPs, NAPA, FoN etc.)'); \
	Category.objects.create(name='Employment (e.g. LTAs, Roma UNV, IT Trainings)'); \
	Category.objects.create(name='Private Sector support (start-ups, agribusiness)'); \
	Category.objects.create(name='Institution Building (e.g. parliament, mobile committee sessions, IT Council, PIMO, RSA)'); \
	Category.objects.create(name='Capacity development (e.g. various study tours and trainings, auditors, intersectoral working groups etc.)'); \
	Category.objects.create(name='Expert support (e.g. DU, Belgrade)'); \
	Category.objects.create(name='Normative support (for preparation or implementation of any law or bylaw e.g. VaW, open data?)'); \
	Category.objects.create(name='Innovative solutions');"

## Import data
import-data:
	docker-compose exec service python manage.py import

logs:
	docker-compose logs -f