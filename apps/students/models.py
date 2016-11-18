from __future__ import unicode_literals

from django.db import models
from django.forms import ModelForm
import re
import random


class CohortManager(models.Manager):
    def validateCohort(self, data):
        print "in validation models.py line 8", data
        return "success!"
    def make_groups(self, id, *args):
        students = self.get(id=id).student_set.all().order_by('?')
        s_count = students.count()
        for size in args:
            if (s_count < (size * 2)):
                return
            count = 0
            group = 1
            for student in students:
                if count <= size:
                    if size == 2:
                        student.pairs=group
                    elif size == 3:
                        student.three_person=group
                    elif size == 4:
                        student.four_person=group
                    else:
                        student.half_class=group
                    count += 1
                    student.save(force_update=True)
                if count == size:
                    count = 0
                    group += 1


class Cohort(models.Model):
    start_date = models.DateField()
    stack = models.CharField(max_length=100)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    objects = CohortManager()
    class Meta:
        unique_together = ('start_date', 'stack')


class StudentManager(models.Manager):
    def __init__(self):
        super(StudentManager, self).__init__()
        self.email_regex = r'^[a-zA-Z0-9.+_-]+@[a-zA-Z0-9._-]+\.[a-zA-Z]+$'
    def validate_student(self, data):
        valid = True
        errors = []
        if len(data['name']) < 2:
            errors.append('please include a name for each student')
            valid = False
        if len(data['email']) < 2:
            errors.append('please include an email for each student')
            valid = False
        elif not re.match(self.email_regex, data['email']):
            errors.append('please include a correctly formatted email for each student')
            valid = False
        if valid:
            return
        return errors
    def parse_add_form(self, form_data):
        students = {}
        for key, value in form_data.iteritems():
            k = filter(unicode.isdigit, key)
            if k:
                k = str(k)
                if key.startswith('student') and k not in students:
                    students[k] = {}
                if key.startswith('student_name'):
                    students[k]['name'] = value
                if key.startswith('student_email'):
                    students[k]['email'] = value
        print students
        return students


class Student(models.Model):
    name = models.CharField(max_length=350)
    email = models.CharField(max_length=350, unique=True)
    cohort = models.ManyToManyField(Cohort)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    half_class = models.IntegerField(blank=True, null=True)
    four_person = models.IntegerField(blank=True, null=True)
    three_person = models.IntegerField(blank=True, null=True)
    pairs = models.IntegerField(blank=True, null=True)
    objects = StudentManager()


instructor_roles = ([
    ('Lead', 'Lead'),
    ('Apprentice', 'Apprentice'),
    ('TA', 'TA')
])


class InstructorManager(models.Manager):
    def __init__(self):
        super(InstructorManager, self).__init__()
        self.email_regex = r'^[a-zA-Z0-9.+_-]+@[a-zA-Z0-9._-]+\.[a-zA-Z]+$'
    def validate_instructor(self, data):
        valid = True
        errors = []
        if len(data['name']) < 2:
            errors.append('please include a name for each instructor')
            valid = False
        if len(data['email']) < 2:
            errors.append('please include an email for each instructor')
            valid = False
        elif not re.match(self.email_regex, data['email']):
            errors.append('please include a valid email for each instructor')
            valid = False
        if valid:
            return
        return errors
    def parse_add_form(self, form_data):
        instructors = {}
        for key, value in form_data.iteritems():
            k = filter(unicode.isdigit, key)
            if k:
                k = str(k)
                if key.startswith('instructor') and k not in instructors:
                    instructors[k] = {}
                if key.startswith('instructor_name'):
                    instructors[k]['name'] = value
                if key.startswith('instructor_email'):
                    instructors[k]['email'] = value
                if key.startswith('instructor_role'):
                    instructors[k]['role'] = value
        return instructors


class Instructor(models.Model):
    name = models.CharField(max_length=350)
    email = models.CharField(max_length=350, unique=True)
    role = models.CharField(max_length=350, choices=instructor_roles, blank=False, default='Lead')
    cohort = models.ManyToManyField(Cohort)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    objects = InstructorManager()
    class Meta:
        unique_together = ('name', 'email')
