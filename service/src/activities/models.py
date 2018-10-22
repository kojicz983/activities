from django.db import models

# Create your models here.
class Location(models.Model):
    name = models.CharField(null=False, blank=False, max_length=50, unique=True)

    def __str__(self):
        return self.name

class Topic(models.Model):
    name = models.CharField(null=False, blank=False, max_length=50, unique=True)

    def __str__(self):
        return self.name

class SDG(models.Model):
    name = models.CharField(null=False, blank=False, max_length=50, unique=True)

    def __str__(self):
        return self.name

class Category(models.Model):
    name = models.CharField(null=False, blank=False, max_length=50, unique=True)

    def __str__(self):
        return self.name

class Activities(models.Model):
    location = models.ForeignKey(Location, on_delete=models.CASCADE)
    topic = models.ForeignKey(Topic, on_delete=models.CASCADE)
    sdg = models.ForeignKey(SDG, on_delete=models.CASCADE)
    category = models.ForeignKey(Category, on_delete=models.CASCADE)
    project_name = models.CharField(null=False, blank=False, max_length=50)
    portfolio = models.CharField(null=False, blank=False, max_length=50)
    cluster = models.CharField(null=False, blank=False, max_length=50)
    specific_activity = models.CharField(null=False, blank=False, max_length=50)
    start_date = models.DateField()
    end_date = models.DateField()
    donor_1 = models.CharField(null=False, blank=False, max_length=50)
    donor_2 = models.CharField(null=False, blank=False, max_length=50)
    donor_3 = models.CharField(null=False, blank=False, max_length=50)
    activity_value = models.IntegerField()
    beneficiaries = models.CharField(null=False, blank=False, max_length=50)

    def __str__(self):
        return self.project_name
