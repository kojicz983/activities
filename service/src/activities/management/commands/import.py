# -*- coding: utf-8 -*-

import pandas as pd
import numpy
from datetime import datetime
from django.core.management.base import BaseCommand, CommandError

from activities.models import Activities, Location, Topic, Category, SDG


class Command(BaseCommand):
    help = 'Private command'

    def add_arguments(self, parser):
        self.stdout.write(self.style.SUCCESS(f'parser: {parser}'))

    def handle(self, *args, **options):
        df = pd.read_excel('./backporting/UNDP_Activities.xlsx', Sheet='2018')
        df = df.loc[:, ~df.columns.str.contains('^Unnamed')]
        df = df.replace(numpy.nan, '', regex=True)

        activity_list = []
        for index, row in df.iterrows():
            category = row['Category (Activity Type, choose from drop down)']
            location = Location.objects.get_or_create(name=row['Location'].lstrip().rstrip())[0]
            sublocation = Location.objects.get_or_create(name=row['Sub-location (if any)'].lstrip().rstrip())[0]
            tpc = row['Topic (choose from drop down)']
            ctg = row['Category (Activity Type, choose from drop down)']
            val = row['Activity Value']
            self.stdout.write(self.style.SUCCESS(f'Location: {location}'))
            self.stdout.write(self.style.SUCCESS(f'Category: {ctg}'))
            self.stdout.write(self.style.SUCCESS(f'Value: {val}'))
            activity_list.append(
                Activities(
                    location=location,
                    sublocation=sublocation,
                    topic=Topic.objects.get(name=row['Topic (choose from drop down)'].lstrip().rstrip()),
                    sdg=SDG.objects.get(name=row['SDG (choose from drop down)'].lstrip().rstrip()),
                    category=Category.objects.get(name=row['Category (Activity Type, choose from drop down)'].lstrip().rstrip()),
                    project_name=row['Project Name'],
                    portfolio=row['Portfolio'],
                    cluster=row['Cluster'],
                    specific_activity=row['Specific Activity (restricted to 140 chars)'],
                    donor_1=row['Donor 1 (choose from drop down)'],
                    donor_2=row['Donor 2 (choose from drop down)'],
                    donor_3=row['Donor 3 (choose from drop down)'],
                    activity_value=row['Activity Value'],
                    beneficiaries=row['Beneficiaries'],
                    start_date=row['Start Date'],
                    end_date=row['End date or Ongoing']
                )
            )
        self.stdout.write(self.style.SUCCESS(f'Start'))
        Activities.objects.bulk_create(activity_list)


