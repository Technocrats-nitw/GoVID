# Generated by Django 3.1.5 on 2021-05-23 19:19

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0007_auto_20210524_0039'),
    ]

    operations = [
        migrations.AlterField(
            model_name='hospital',
            name='name',
            field=models.CharField(default='-', max_length=100),
        ),
    ]
