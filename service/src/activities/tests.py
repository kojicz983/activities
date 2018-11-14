from rest_framework.test import APITestCase
from .models import Activities, Location, Topic, SDG, Category

# Create your tests here.
class ActivitiesRange(APITestCase):
    def setUp(self):
        location = Location.objects.create(name='Beograd')
        topic = Topic.objects.create(name='Topic')
        sdg = SDG.objects.create(name='sdg')
        category = Category.objects.create(name='category')
        Activities.objects.create(
            location=location,
            topic=topic,
            sdg=sdg,
            category=category,
            project_name='projet name',
            portfolio='portfolio',
            cluster='cluster',
            specific_activity='specific activity',
            start_date='11.11.2011',
            end_date='on going',
            donor_1='Donor 1',
            activity_value=50000,
            beneficiaries='Beneficiaries'
        )
        Activities.objects.create(
            location=location,
            topic=topic,
            sdg=sdg,
            category=category,
            project_name='projet name',
            portfolio='portfolio',
            cluster='cluster',
            specific_activity='specific activity',
            start_date='11.11.2011',
            end_date='on going',
            donor_1='Donor 1',
            activity_value=60000,
            beneficiaries='Beneficiaries'
        )

    def test_get_activity_value_range(self):
        url = '/api/activities/?activity_value_min=49999&activity_value_max=50001'
        response = self.client.get(url)
        self.assertEqual(len(response.data), 1)