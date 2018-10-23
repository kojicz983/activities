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
            location = Location.objects.get_or_create(name=row['Location'])[0]
            activity_list.append(
                Activities(
                    location=location,
                    topic=Topic.objects.get(name=row['Topic (choose from drop down)']),
                    sdg=SDG.objects.get(name=row['SDG (choose from drop down)']),
                    category=Category.objects.get(name=row['Category (Activity Type, choose from drop down)']),
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

        Activities.objects.bulk_create(activity_list)


