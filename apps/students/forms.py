from django import forms
from django.forms import extras, ModelChoiceField, ModelForm
from django.forms.fields import DateField
from .models import Instructor, Cohort, Student
from django.contrib.admin import widgets


##############################
## cohort form constructors ##
##############################


stack_choices = ([
    ('Web Fundamentals', 'Web Fundamentals'),
    ('Python', 'Python'),
    ('LAMP', 'LAMP'),
    ('Ruby on Rails', 'Ruby on Rails'),
    ('iOS', 'iOS'),
    ('MEAN', 'MEAN')
])


instructor_roles = ([
    ('Lead', 'Lead'),
    ('Apprentice', 'Apprentice'),
    ('TA', 'TA')
])


class InstructorChoice(ModelChoiceField):
    def label_from_instance(self, obj):
        return obj.name + " (" + obj.role + ")"


class CohortForm(forms.Form):
    start_date = forms.DateField(widget = extras.SelectDateWidget(empty_label="Nothing", attrs={'class': 'ui fluid dropdown'}))
    stack = forms.ChoiceField(widget = forms.Select(attrs={'class': 'ui fluid dropdown'}), choices = stack_choices)
    student_name1 = forms.CharField(widget=forms.TextInput(attrs={'placeholder':'name'}))
    student_email1 = forms.EmailField(widget=forms.TextInput(attrs={'placeholder':'email'}))
    instructors = InstructorChoice(queryset=Instructor.objects.all(), widget=forms.CheckboxSelectMultiple, empty_label=None)


class DateInput(forms.DateInput):
    input_type = 'date'


class EditCohortForm(ModelForm):
    start_date = forms.DateField(widget = extras.SelectDateWidget(empty_label="Nothing", attrs={'class': 'ui fluid dropdown'}))
    stack = forms.ChoiceField(widget = forms.Select(attrs={'class': 'ui fluid dropdown'}), choices = stack_choices)
    class Meta:
        model = Cohort
        fields = ['stack', 'start_date']


###############################
# instructor form constructor #
###############################


class InstructorForm(forms.Form):
    instructor_name1 = forms.CharField(widget=forms.TextInput(attrs={'placeholder':'instructor name'}))
    instructor_email1 = forms.EmailField(widget=forms.TextInput(attrs={'placeholder':'instructor email'}))
    instructor_role1 = forms.ChoiceField(widget = forms.Select(attrs={'class': 'ui fluid dropdown'}), choices = instructor_roles, )


class EditInstructorForm(ModelForm):
    role = forms.ChoiceField(widget = forms.Select(attrs={'class': 'ui fluid dropdown'}), choices = instructor_roles)
    class Meta:
        model = Instructor
        fields = ['name', 'email', 'role']


class EditStudentForm(ModelForm):
    class Meta:
        model = Student
        fields = ['name', 'email']
