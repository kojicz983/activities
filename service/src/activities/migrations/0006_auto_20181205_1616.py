# Generated by Django 2.1.4 on 2018-12-05 16:16

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('activities', '0005_auto_20181205_1612'),
    ]

    operations = [
        migrations.AlterField(
            model_name='activities',
            name='activity_value',
            field=models.CharField(blank=True, max_length=50, null=True),
        ),
    ]