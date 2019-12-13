from django.db import models
from django.conf import settings


class Location(models.Model):
    name = models.CharField(null=False, blank=False, max_length=50, unique=True)
    latitude = models.DecimalField(max_digits=30, decimal_places=15, default=0)
    longitude = models.DecimalField(max_digits=30, decimal_places=15, default=0)

    def __str__(self):
        return self.name


class Topic(models.Model):
    name = models.CharField(null=False, blank=False, max_length=100, unique=True)

    def __str__(self):
        return self.name


class SDG(models.Model):
    name = models.CharField(null=False, blank=False, max_length=50, unique=True)

    def __str__(self):
        return self.name


class Category(models.Model):
    name = models.CharField(null=False, blank=False, max_length=150, unique=True)

    def __str__(self):
        return self.name


class Donor(models.Model):
    name = models.CharField(null=False, blank=False, max_length=150, unique=True)

    def __str__(self):
        return self.name


class ActivitiesManager(models.Manager):
    def get_queryset(self):
        return super(ActivitiesManager, self).get_queryset()\
            .select_related('location')\
            .select_related('sublocation')\
            .select_related('topic')\
            .select_related('sdg')\
            .select_related('donor_1')\
            .select_related('donor_2')\
            .select_related('donor_3')\
            .prefetch_related('categories')


class Activities(models.Model):
    location = models.ForeignKey(
        Location, on_delete=models.CASCADE, related_name='location')
    sublocation = models.ForeignKey(
        Location, on_delete=models.CASCADE, null=True, related_name='sublocation')
    topic = models.ForeignKey(Topic, on_delete=models.CASCADE)
    sdg = models.ForeignKey(SDG, on_delete=models.CASCADE)
    categories = models.ManyToManyField(Category)
    project_name = models.CharField(null=False, blank=False, max_length=300)
    portfolio = models.CharField(null=False, blank=False, max_length=50)
    cluster = models.CharField(null=False, blank=False, max_length=50)
    specific_activity = models.CharField(null=False, blank=False, max_length=300)
    start_date = models.CharField(null=False, blank=False, max_length=50)
    end_date = models.CharField(null=True, blank=True, max_length=50)
    donor_1 = models.ForeignKey(
        Donor, on_delete=models.CASCADE, related_name='donor_1', null=True, blank=True)
    donor_2 = models.ForeignKey(
        Donor, on_delete=models.CASCADE, related_name='donor_2', null=True, blank=True)
    donor_3 = models.ForeignKey(
        Donor, on_delete=models.CASCADE, related_name='donor_3', null=True, blank=True)
    activity_value = models.CharField(null=True, blank=True, max_length=50)
    beneficiaries = models.CharField(null=True, blank=True, max_length=50)
    owner = models.ForeignKey(
        settings.AUTH_USER_MODEL, on_delete=models.SET_NULL, null=True, blank=True)

    objects = ActivitiesManager()

    def __str__(self):
        return self.project_name
