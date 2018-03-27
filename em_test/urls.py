"""em_test URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^em/$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^em/$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^em/blog/', include('blog.urls'))
"""
from django.conf.urls import url, include
from django.contrib import admin
from em import views
from em.models import *
from em import urls as emurls
from django.contrib.auth.decorators import login_required, permission_required


testspatterns = [
    url(r'^$', views.TestPageView.as_view(), name='test'),
    url(r'^(?P<album_id>\d+)/$', views.TestPageView.as_view(), name='test')
]

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^accounts/', include('django.contrib.auth.urls')),
    url(r'^em/$', include(emurls.indexpatterns)),
    url(r'^em/about/$',views.AboutPageView.as_view(), name='about'),
    url(r'^em/album/$', views.album, name = 'album'),
    url(r'^em/contribute/$', views.contribute, name = 'contribute'),
    url(r'^em/emergency/', views.EmergencyPageView.as_view(), name='emergency'),
    url(r'^em/emergency_request/$', views.emergency_request, name = 'emergency_request'),
    url(r'^em/event_main/$', views.event_main, name = 'event_main'),
    url(r'^em/feedback/$', views.feedback, name = 'feedback'),
    url(r'^em/friends/$', views.friends, name = 'friends'),
    url(r'^em/myevent/$', views.myevent, name = 'myevent'),
    url(r'^em/mytrip/$', views.mytrip, name = 'mytrip'),
    url(r'^em/plan_event/$', views.plan_event, name = 'plan_event'),
    url(r'^em/plan_trip/$', views.plan_trip, name = 'plan_trip'),
    url(r'^em/search_event/$', views.search_event, name = 'search_event'),
    url(r'^em/search_trip/$', views.search_trip, name = 'search_trip'),
    url(r'^em/settings/$', views.setting, name = 'setting'),
    url(r'^em/story/$', views.story, name = 'story'),
    url(r'^em/timeline/$', views.timeline, name = 'timeline'),
    url(r'^em/traveller_main/$', views.traveller_main, name = 'traveller_main'),
]

