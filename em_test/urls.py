from django.conf import settings
from django.conf.urls.static import static
from django.conf.urls import url, include
from django.contrib import admin
from em import views
from em.models import *
from em import urls as emurls
from django.contrib.auth.decorators import login_required, permission_required, user_passes_test

#PROJECT URLS

testspatterns = [
    url(r'^$', views.TestPageView.as_view(), name='test'),
    url(r'^(?P<album_id>\d+)/', views.TestPageView.as_view(), name='test')
]

urlpatterns = [
    url(r'^$', views.TestPageView.as_view(), name='test'),
    url(r'^admin/', admin.site.urls),
    url(r'^account/login', include(emurls.indexpatterns)),
    url(r'^em/', include(emurls.indexpatterns)),
    url(r'^em/about/', include(emurls.aboutpatterns)),
    url(r'^em/album/', include(emurls.albumpatterns)),
    url(r'^em/contribute/', include(emurls.contributepatterns)),
    url(r'^em/emergency/', include(emurls.emergencypatterns)),
    url(r'^em/emergency_request/', include(emurls.emergencyrequestpatterns)),
    url(r'^em/event_main/', include(emurls.eventmainpatterns)),
    url(r'^em/feedback/', include(emurls.feedbackpatterns)),
    url(r'^em/friends/', include(emurls.friendspatterns)),
    url(r'^em/myevent/', include(emurls.myeventpatterns)),
    url(r'^em/mytrip/', include(emurls.mytrippatterns)),
    url(r'^em/plan_event/', include(emurls.planeventpatterns)),
    url(r'^em/plan_trip/', include(emurls.plantrippatterns)),
    url(r'^em/search_event/', include(emurls.searcheventpatterns)),
    url(r'^em/search_trip/', include(emurls.searchtrippatterns)),
    url(r'^em/settings/', include(emurls.profilesettingspatterns)),
    url(r'^em/story/', include(emurls.storypatterns)),
    url(r'^em/timeline/', include(emurls.timelinepatterns)),
    url(r'^em/traveller_main/', include(emurls.travellermainpatterns)),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)