# -*- coding: utf-8 -*-

import requests
from django.core.management.base import BaseCommand, CommandError

from activities.models import Activities, Location, Topic, Category, SDG


class Command(BaseCommand):
    help = 'Geo location finder'

    def handle(self, *args, **options):
        locations = Location.objects.all()

        for location in locations:
            uri = f'http://open.mapquestapi.com/geocoding/v1/address?key=yrtZFCYgwh5jcTcSJwviyepuxMmrdQBz&location={location.name},RS'

            response = requests.get(uri).json()
            try:
                geo_location = response['results'][0]['locations'][0]['latLng']
            except Exception as err:
                self.stdout.write(self.style.ERROR(f'{location.name}'))
                self.stdout.write(self.style.ERROR(f'{err}'))
                continue

            location.latitude = geo_location['lat']
            location.longitude = geo_location['lng']

            location.save()

        self.stdout.write(self.style.SUCCESS('Done'))

            

            


