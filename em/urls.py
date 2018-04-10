from django.conf.urls import url
from em import views
from django.contrib.auth.decorators import login_required, permission_required, user_passes_test
from django.contrib.auth.models import Group


indexpatterns = [
    url(r'^$',views.IndexPageView.as_view(), name='index'),
   # url(r'^?next=(?P<redirect_url>[/\w]+)$',login_required(views.IndexPageView.as_view()), name='index'),
    url(r'^logout/', views.logout_page, name='logout_page')

]

aboutpatterns = [
    #url(r'^$',user_passes_test(lambda u: Group.objects.get(name='Baristas') in u.groups.all())(views.AboutPageView.as_view()), name='about')
    url(r'^$',login_required(views.AboutPageView.as_view()), name='about'),
    url(r'^about_fill/$',login_required(views.AboutFillPageView.as_view()), name='about_fill')
]

albumpatterns = [
    url(r'^$',login_required(views.AlbumPageView.as_view()), name='album')

]

contributepatterns = [
    url(r'^$',login_required(views.ContributePageView.as_view()), name='contribute')

]

emergencypatterns = [
    url(r'^$',login_required(views.EmergencyPageView.as_view()), name='emergency')

]

emergencyrequestpatterns = [
    url(r'^$',login_required(views.EmergencyRequestPageView.as_view()), name='emergencyrequest')

]

eventmainpatterns = [
    url(r'^$',login_required(views.EventMainPageView.as_view()), name='eventmain')

]

feedbackpatterns = [
    url(r'^$',login_required(views.FeedbackPageView.as_view()), name='feedback')

]

friendspatterns = [
    url(r'^$',login_required(views.FriendsPageView.as_view()), name='friends')

]

myeventpatterns = [
    url(r'^$',login_required(views.MyEventPageView.as_view()), name='myevent')

]

mytrippatterns = [
    url(r'^$',login_required(views.MyTripPageView.as_view()), name='mytrip')

]

planeventpatterns = [
    url(r'^$',login_required(views.PlanEventPageView.as_view()), name='planevent')

]

plantrippatterns = [
    url(r'^$',login_required(views.PlanTripPageView.as_view()), name='plantrip')

]

reportspatterns = [
    url(r'^$',login_required(views.ReportsPageView.as_view()), name='reports')

]

searcheventpatterns = [
    url(r'^$',login_required(views.SearchEventPageView.as_view()), name='searchevent')

]

searchtrippatterns = [
    url(r'^$',login_required(views.SearchTripPageView.as_view()), name='searchtrip')

]

profilesettingspatterns = [
    url(r'^$',login_required(views.ProfileSettingsPageView.as_view()), name='profilesetting')

]

storypatterns = [
    url(r'^$',login_required(views.StoryPageView.as_view()), name='story')

]

timelinepatterns = [
    url(r'^$',login_required(views.TimelinePageView.as_view()), name='timeline')

]

travellermainpatterns = [
    url(r'^$',login_required(views.TravellerMainPageView.as_view()), name='travellermain')

]


