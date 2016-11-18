# -*- coding: utf-8 -*-
# Generated by Django 1.10.2 on 2016-11-05 03:44
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('students', '0011_auto_20161105_0341'),
    ]

    operations = [
        migrations.AlterField(
            model_name='student',
            name='four_person',
            field=models.IntegerField(blank=True, default=None, max_length=12),
        ),
        migrations.AlterField(
            model_name='student',
            name='half_class',
            field=models.IntegerField(blank=True, default=None, max_length=12),
        ),
        migrations.AlterField(
            model_name='student',
            name='pairs',
            field=models.IntegerField(blank=True, default=None, max_length=12),
        ),
        migrations.AlterField(
            model_name='student',
            name='three_person',
            field=models.IntegerField(blank=True, default=None, max_length=12),
        ),
    ]
