# -*- coding: utf-8 -*-

import pandas as pd
import numpy
from datetime import datetime
from django.core.management.base import BaseCommand, CommandError

from activities.models import Activities, Location, Topic, Category, SDG, Donor


class Command(BaseCommand):
    help = 'Private command'

    def add_arguments(self, parser):
        self.stdout.write(self.style.SUCCESS(f'parser: {parser}'))

    def handle(self, *args, **options):
        df = pd.read_excel('./backporting/UNDP_Activities.xlsx', Sheet='2018')
        df = df.loc[:, ~df.columns.str.contains('^Unnamed')]
        df = df.replace(numpy.nan, '', regex=True)

        for index, row in df.iterrows():
            category = row['Category (Activity Type, choose from drop down)']
            location = Location.objects.get_or_create(name=row['Location'].strip())[0]
            sublocation = Location.objects.get_or_create(name=row['Sub-location (if any)'].strip())[0]
            tpc = row['Topic (choose from drop down)']            
            val = row['Activity Value']
            self.stdout.write(self.style.SUCCESS(f'Location: {location}'))
            self.stdout.write(self.style.SUCCESS(f'Value: {val}'))

            activity = Activities.objects.create(
                location=location,
                sublocation=sublocation,
                topic=Topic.objects.get(name=row['Topic (choose from drop down)'].strip()),
                sdg=SDG.objects.get(name=row['SDG (choose from drop down)'].strip()),
                project_name=row['Project Name'],
                portfolio=row['Portfolio'],
                cluster=row['Cluster'],
                specific_activity=row['Specific Activity (restricted to 140 chars)'],
                donor_1=Donor.objects.get_or_create(name=row['Donor 1 (choose from drop down)'].strip())[0],
                donor_2=Donor.objects.get_or_create(name=row['Donor 2 (choose from drop down)'].strip())[0],
                donor_3=Donor.objects.get_or_create(name=row['Donor 3 (choose from drop down)'].strip())[0],
                activity_value=row['Activity Value'],
                beneficiaries=row['Beneficiaries'],
                start_date=row['Start Date'],
                end_date=row['End date or Ongoing']
            )

            primary_category = row['Category (Activity Type, choose from drop down)'].strip()
            secondary_category = row['Secondary category (choose from drop down)'].strip()

            activity.categories.add(Category.objects.get(name=primary_category))
            if secondary_category:
                activity.categories.add(Category.objects.get(name=secondary_category))
            
            activity.save()

        self.stdout.write(self.style.SUCCESS(f'Start'))

