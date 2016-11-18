from django.shortcuts import render, redirect
from django.http import HttpRequest
from django.db import IntegrityError
from django.contrib import messages
from django.core.urlresolvers import reverse
from .models import Cohort, Student, Instructor
from .forms import CohortForm, EditCohortForm, InstructorForm, EditInstructorForm, EditStudentForm
import datetime


#################################################
########### render (get) functions ###########
#################################################


def index(request):
    return render(request, 'students/index.html')


def login(request):
    return redirect(reverse('students:cohorts'))


def dashboard(request):
    data = {
        'cohorts': Cohort.objects.all().order_by('-start_date')
    }
    return render(request, 'students/dashboard.html', data)


def instructors(request):
    data = {'instructors': Instructor.objects.all().order_by('-role')}
    return render(request, 'students/instructors.html', data)


def add_cohort(request):
    data = {
        "form": CohortForm(),
        "instructors": Instructor.objects.all()
    }
    return render(request, 'students/add.html', data)


def add_instructor(request):
    data = { "form": InstructorForm() }
    return render(request, 'students/add_instructor.html', data)


def instructor(request, id):
    data = {
        "instructor": Instructor.objects.get(id=id),
        "form": EditInstructorForm(instance=Instructor.objects.get(id=id)),
        "source": request.META['HTTP_REFERER']
    }
    return render(request, 'students/instructor.html', data)


def cohort(request, id):
    cohort = Cohort.objects.get(id=id)
    data = {
        "cohort": Cohort.objects.get(id=id),
        "cohort_form": EditCohortForm(instance=Cohort.objects.get(id=id)),
        "form": CohortForm(),
    }
    return render(request, 'students/cohort.html', data)


def student(request, id, cohort_id):
    data = {
        'student': Student.objects.get(id=id),
        'form': EditStudentForm(instance=Student.objects.get(id=id)),
        'cohort': Cohort.objects.get(id=cohort_id),
        "source": request.META['HTTP_REFERER']
    }
    return render(request, 'students/student.html', data)


###############################################
############### group functions ###############
###############################################


def groups(request, id, size):
    print request.get_full_path()
    cohort = Cohort.objects.get(id=id)
    print "cohort object:", repr(cohort)
    print "without repr:", cohort
    if size == '0':
        o = 'name'
    elif size == '2':
        o = 'pairs'
    elif size == '3':
        o = 'three_person'
    elif size == '4':
        o = 'four_person'
    elif size == '10':
        o = 'half_class'
    data = {
        "cohort": cohort,
        "students": cohort.student_set.all().order_by(o),
        "size": size
    }
    return render(request, 'students/groups.html', data)


def create_groups(request, id, size):
    half_class = Cohort.objects.get(id=id).student_set.all().count()/2
    Cohort.objects.make_groups(id, 2,3,4,half_class)
    return redirect(reverse('students:groups', kwargs={'id':id, 'size':size} ))


###############################################
############## destroy functions ##############
###############################################


def destroy_cohort(request, id):
    cohort = Cohort.objects.get(id=id)
    cohort.delete()
    return redirect(reverse('students:cohorts'))


def destroy_instructor(request, id):
    instructor = Instructor.objects.get(id=id)
    instructor.delete()
    return redirect(reverse('students:instructors'))


def remove_instructor(request, id, cohort_id):
    instructor = Instructor.objects.get(id=id)
    cohort = Cohort.objects.get(id=cohort_id)
    instructor.cohort.remove(cohort)
    return redirect(reverse('students:cohort', kwargs={'id': cohort_id}))


def remove_student(request, id, cohort_id):
    student = Student.objects.get(id=id)
    cohort = Cohort.objects.get(id=cohort_id)
    student.cohort.remove(cohort)
    return redirect(reverse('students:cohort', kwargs={'id': cohort_id}))


#################################################
########### create functions ####################
#################################################


def create_cohort(request):
    data = Student.objects.parse_add_form(request.POST)
    year = int(request.POST['start_date_year'])
    month = int(request.POST['start_date_month'])
    day = int(request.POST['start_date_day'])
    date = datetime.date(year, month, day)
    valid = True
    try:
        cohort = Cohort.objects.create(start_date=date, stack=request.POST['stack'])
    except IntegrityError as e:
        messages.error(request, "This cohort already exists in the database.")
        valid = False
    if valid:
        for sid, sdict in data.iteritems():
            errors = Student.objects.validate_student({'name': sdict['name'], 'email': sdict['email']})
            if not errors:
                student, created = Student.objects.get_or_create(name=sdict['name'], email=sdict['email'])
                student.cohort.add(cohort)
            else:
                for err in errors:
                    messages.error(request, err)
        for id in request.POST.getlist('instructors'):
            i = Instructor.objects.get(id=id)
            i.cohort.add(cohort)
        cohort.objects.make_groups(id, 2,3,4,half_class)
    return redirect(reverse('students:cohorts'))


def create_instructor(request):
    instructors = Instructor.objects.parse_add_form(request.POST)
    for key, value in instructors.iteritems():
        errors = Instructor.objects.validate_instructor({'name': value['name'], 'email': value['email'], 'role': value['role']})
        if not errors:
            try:
                Instructor.objects.create(name=value['name'], email=value['email'], role=value['role'])
            except IntegrityError as e:
                messages.error(request, "Instructor {} already exists in the database.".format(value['name']))
                return redirect(reverse('students:add_instructor'))
        else:
            for err in errors:
                messages.error(request, err)
                redirect(reverse('students:add_instructor'))
    return redirect(reverse('students:instructors'))


###############################################
########### update functions ##################
###############################################


def update_instructor(request, id):
    print request.META
    Instructor.objects.filter(id=id).update(name=request.POST['name'], email=request.POST['email'], role=request.POST['role'])
    return redirect(reverse('students:instructors'))


def update_cohort(request, id):
    year = int(request.POST['start_date_year'])
    month = int(request.POST['start_date_month'])
    day = int(request.POST['start_date_day'])
    date = datetime.date(year, month, day)
    Cohort.objects.filter(id=id).update(stack=request.POST['stack'], start_date=date)
    return redirect(reverse('students:cohorts'))


def update_student(request, id, cohort_id):
    Student.objects.filter(id=id).update(name=request.POST['name'], email=request.POST['email'])
    return redirect(reverse('students:cohort', kwargs={'id': cohort_id }))


def append_instructor(request, id):
    cohort = Cohort.objects.get(id=id)
    for instructor_id in request.POST.getlist('instructors'):
        i = Instructor.objects.get(id=instructor_id)
        i.cohort.add(cohort)
    return redirect(reverse('students:cohort', kwargs={'id': id}))


def append_student(request, id):
    cohort = Cohort.objects.get(id=id)
    students = Student.objects.parse_add_form(request.POST)
    for sid, sdict in students.iteritems():
        errors = Student.objects.validate_student({'name': sdict['name'], 'email': sdict['email']})
        if not errors:
            print "sdict", sdict
            student, created = Student.objects.update_or_create(email=sdict['email'], defaults={'name': sdict['name'], 'email': sdict['email']})
            student.cohort.add(cohort)
        else:
            for err in errors:
                messages.error(request, err)
    return redirect(reverse('students:cohort', kwargs={'id': id}))
