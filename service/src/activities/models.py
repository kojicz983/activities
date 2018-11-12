from django.db import models

# Create your models here.
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


class ActivitiesManager(models.Manager):
    def get_queryset(self):
        return super(ActivitiesManager, self).get_queryset()\
            .select_related('location')\
            .select_related('topic')\
            .select_related('sdg')\
            .select_related('category')


class Activities(models.Model):
    location = models.ForeignKey(Location, on_delete=models.CASCADE)
    topic = models.ForeignKey(Topic, on_delete=models.CASCADE)
    sdg = models.ForeignKey(SDG, on_delete=models.CASCADE)
    category = models.ForeignKey(Category, on_delete=models.CASCADE)
    project_name = models.CharField(null=False, blank=False, max_length=300)
    portfolio = models.CharField(null=False, blank=False, max_length=50)
    cluster = models.CharField(null=False, blank=False, max_length=50)
    specific_activity = models.CharField(null=False, blank=False, max_length=300)
    start_date = models.CharField(null=False, blank=False, max_length=50)
    end_date = models.CharField(null=True, blank=True, max_length=50)
    donor_1 = models.CharField(null=True, blank=False, max_length=50)
    donor_2 = models.CharField(null=True, blank=True, max_length=50)
    donor_3 = models.CharField(null=True, blank=True, max_length=50)
    activity_value = models.IntegerField()
    beneficiaries = models.CharField(null=True, blank=True, max_length=50)

    objects = ActivitiesManager()

    def __str__(self):
        return self.project_name
