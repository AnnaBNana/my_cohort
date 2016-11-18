from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.index, name='index'),
    url(r'^login$', views.login, name='login'),
    url(r'^dashboard$', views.dashboard, name='cohorts'),
    url(r'^add_cohort$', views.add_cohort, name='add'),
    url(r'^cohort/create$', views.create_cohort, name='create'),
    url(r'^cohort/(?P<id>[0-9]+)', views.cohort, name='cohort'),
    url(r'^cohort/update/(?P<id>[0-9]+)', views.update_cohort, name='update'),
    url(r'^cohort/destroy/(?P<id>[0-9]+)', views.destroy_cohort, name='destroy'),
    url(r'^cohort/groups/(?P<id>[0-9]+)/(?P<size>[0-9]+)', views.groups, name='groups'),
    url(r'^cohort/groups/create/(?P<id>[0-9]+)/(?P<size>[0-9]+)', views.create_groups, name='create_groups'),
    url(r'^add_instructor$', views.add_instructor, name='add_instructor'),
    url(r'^instructors/create$', views.create_instructor, name='create_instructor'),
    url(r'^instructors$', views.instructors, name='instructors'),
    url(r'^instructor/(?P<id>[0-9]+)', views.instructor, name='instructor'),
    url(r'^instructor/update/(?P<id>[0-9]+)', views.update_instructor, name='update_instructor'),
    url(r'^instructor/destroy/(?P<id>[0-9]+)', views.destroy_instructor, name='destroy_instructor'),
    url(r'^instructor/remove/(?P<id>[0-9]+)/(?P<cohort_id>[0-9]+)', views.remove_instructor, name='remove_instructor'),
    url(r'^instructor/append_instructor/(?P<id>[0-9]+)', views.append_instructor, name='append_instructor'),
    url(r'^student/(?P<id>[0-9]+)/(?P<cohort_id>[0-9]+)', views.student, name='student'),
    url(r'^student/update/(?P<id>[0-9]+)/(?P<cohort_id>[0-9]+)', views.update_student, name="update_student"),
    url(r'^student/remove/(?P<id>[0-9]+)/(?P<cohort_id>[0-9]+)', views.remove_student, name='remove_student'),
    url(r'^student/append_student/(?P<id>[0-9]+)', views.append_student, name='append_student')
]
