# Generated by Django 2.1.2 on 2018-10-31 15:15

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('activities', '0002_auto_20181029_1358'),
    ]

    operations = [
        migrations.AlterField(
            model_name='activities',
            name='project_name',
            field=models.CharField(max_length=300),
        ),
    ]
