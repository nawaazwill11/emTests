"""em_test URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url, include
from django.contrib import admin
from em import views

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^$', views.index, name = 'index'),
    url(r'^about/$', views.about, name = 'about'),
    url(r'^album/$', views.album, name = 'album'),
    url(r'^contribute/$', views.contribute, name = 'contribute'),
    url(r'^emergency/$', views.emergency, name = 'emergency'),
    url(r'^emergency_request/$', views.emergency_request, name = 'emergency_request'),
    url(r'^event_main/$', views.event_main, name = 'event_main'),
    url(r'^feedback/$', views.feedback, name = 'feedback'),
    url(r'^friends/$', views.friends, name = 'friends'),
    url(r'^myevent/$', views.myevent, name = 'myevent'),
    url(r'^mytrip/$', views.mytrip, name = 'mytrip'),
    url(r'^plan_event/$', views.plan_event, name = 'plan_event'),
    url(r'^plan_trip/$', views.plan_trip, name = 'plan_trip'),
    url(r'^search_event/$', views.search_event, name = 'search_event'),
    url(r'^search_trip/$', views.search_trip, name = 'search_trip'),
    url(r'^settings/$', views.setting, name = 'setting'),
    url(r'^story/$', views.story, name = 'story'),
    url(r'^timeline/$', views.timeline, name = 'timeline'),
    url(r'^traveller_main/$', views.traveller_main, name = 'traveller_main'),
]
