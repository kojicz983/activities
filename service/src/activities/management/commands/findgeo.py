# -*- coding: utf-8 -*-

import requests
from django.core.management.base import BaseCommand

from activities.models import Location


class Command(BaseCommand):
    help = 'Geo location finder'
    key = 'yrtZFCYgwh5jcTcSJwviyepuxMmrdQBz'
    url = 'http://open.mapquestapi.com/geocoding/v1'

    def handle(self, *args, **options):
        locations = Location.objects.all()

        for location in locations:
            uri = f'{self.url}/address?key={self.key}&location={location.name},RS'

            response = requests.get(uri).json()
            try:
                geo_location = response['results'][0]['locations'][0]['latLng']
            except KeyError as err:
                self.stdout.write(self.style.ERROR(f'{location.name}'))
                self.stdout.write(self.style.ERROR(f'{err}'))
                continue
            except IndexError as err:
                self.stdout.write(self.style.ERROR(f'{location.name}'))
                self.stdout.write(self.style.ERROR(f'{err}'))
                continue

            location.latitude = geo_location['lat']
            location.longitude = geo_location['lng']

            location.save()

        self.stdout.write(self.style.SUCCESS('Done'))
