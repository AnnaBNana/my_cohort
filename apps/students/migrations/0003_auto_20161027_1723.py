# -*- coding: utf-8 -*-
# Generated by Django 1.10.2 on 2016-10-27 17:23
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('students', '0002_auto_20161025_0540'),
    ]

    operations = [
        migrations.AddField(
            model_name='student',
            name='nickname',
            field=models.CharField(default='Hey You!', max_length=350),
        ),
        migrations.AlterField(
            model_name='instructor',
            name='role',
            field=models.CharField(choices=[('lead', 'Lead'), ('apprentice', 'Apprentice'), ('ta', 'TA')], default='Lead', max_length=350),
        ),
        migrations.AlterField(
            model_name='student',
            name='email',
            field=models.CharField(max_length=350, unique=True),
        ),
    ]
