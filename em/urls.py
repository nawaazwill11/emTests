from django.conf.urls import url
from em import views
from django.contrib.auth.decorators import login_required, permission_required, user_passes_test
from django.contrib.auth.models import Group


indexpatterns = [
    url(r'^$',views.IndexPageView.as_view(), name='index'),
   # url(r'^?next=(?P<redirect_url>[/\w]+)$',views.IndexPageView.as_view(), name='index'),


]

aboutpatterns = [
    url(r'^$',user_passes_test(lambda u: Group.objects.get(name='Baristas') in u.groups.all())(views.AboutPageView.as_view()), name='about')

]

albumpatterns = [
    url(r'^$',login_required(views.AlbumPageView.as_view()), name='album')

]

contributepatterns = [
    url(r'^$',views.ContributePageView.as_view(), name='contribute')

]

emergencypatterns = [
    url(r'^$',views.EmergencyPageView.as_view(), name='emergency')

]

emergencyrequestpatterns = [
    url(r'^$',views.EmergencyRequestPageView.as_view(), name='emergencyrequest')

]

eventmainpatterns = [
    url(r'^$',views.EventMainPageView.as_view(), name='eventmain')

]

feedbackpatterns = [
    url(r'^$',views.FeedbackPageView.as_view(), name='feedback')

]

friendspatterns = [
    url(r'^$',views.FriendsPageView.as_view(), name='friends')

]

myeventpatterns = [
    url(r'^$',views.MyEventPageView.as_view(), name='myevent')

]

mytrippatterns = [
    url(r'^$',views.MyTripPageView.as_view(), name='mytrip')

]

planeventpatterns = [
    url(r'^$',views.PlanEventPageView.as_view(), name='planevent')

]

plantrippatterns = [
    url(r'^$',views.PlanTripPageView.as_view(), name='plantrip')

]

searcheventpatterns = [
    url(r'^$',views.SearchEventPageView.as_view(), name='searchevent')

]

searchtrippatterns = [
    url(r'^$',views.IndexPageView.as_view(), name='searchtrip')

]

profilesettingspatterns = [
    url(r'^$',views.ProfileSettingsPageView.as_view(), name='profilesetting')

]

storypatterns = [
    url(r'^$',views.StoryPageView.as_view(), name='story')

]

timelinepatterns = [
    url(r'^$',login_required(views.TimelinePageView.as_view()), name='timeline')

]

travellermainpatterns = [
    url(r'^$',views.TravellerMainPageView.as_view(), name='travellermain')

]


