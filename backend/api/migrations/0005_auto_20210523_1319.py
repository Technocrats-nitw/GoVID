# Generated by Django 3.1.5 on 2021-05-23 07:49

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0004_auto_20210523_1306'),
    ]

    operations = [
        migrations.AlterField(
            model_name='doctors',
            name='contact',
            field=models.CharField(max_length=11),
        ),
        migrations.AlterField(
            model_name='doctors',
            name='latitude',
            field=models.CharField(max_length=20),
        ),
        migrations.AlterField(
            model_name='doctors',
            name='longitude',
            field=models.CharField(max_length=20),
        ),
    ]
