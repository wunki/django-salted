from django.conf.urls import patterns, include, url

from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    url(r'^$', 'demo_project.demo.views.index'),
    url(r'^admin/', include(admin.site.urls)),
)
