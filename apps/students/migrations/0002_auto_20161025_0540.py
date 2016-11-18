# -*- coding: utf-8 -*-
# Generated by Django 1.10.2 on 2016-10-25 05:40
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('students', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='instructor',
            name='email',
            field=models.CharField(max_length=350, unique=True),
        ),
        migrations.AlterUniqueTogether(
            name='instructor',
            unique_together=set([('name', 'email')]),
        ),
    ]