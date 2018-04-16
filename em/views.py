from django.contrib.auth.decorators import login_required, permission_required
from django.contrib.auth.models import User
from django.contrib import auth
from django.contrib.auth import authenticate, logout
from django.contrib.auth import login as auth_login 
from django.core.exceptions import ValidationError
from django.core import serializers
from django.contrib.sessions.models import Session
from django.core.urlresolvers import reverse
from django.http import HttpResponseRedirect, HttpResponsePermanentRedirect, JsonResponse
from django.shortcuts import render
from django.views.generic import TemplateView
from .models import Login, Pi, Trip, Event, Misc
from .mods.forms import LoginForm, RegistrationForm, Printer, AboutEditForm, GetInitial, ProfileForm, TripPlanValidation, MyTripForm, EventPlanForm, MyEventForm, FeedbackForm, ContributeForm, ReportForm, ProfileRoot, Miscer, RegPi, Bifurcator, Listing, JoinTrip, JoinEvent
from .mods.filters import TripSearchFilter, EventSearchFilter
from .mods.test import SharingForm
from .mods.required import UserInfo
import re


class IndexPageView(TemplateView):
	template_name = 'index.html'
	form = LoginForm
	rform = RegistrationForm

	def get(self, request, *args, **kwargs):
		form = self.form(initial='')
		rform  = self.rform(initial='')
		#Printer.print(rform)
		return render(request, self.template_name, {'form': form,'rform': rform})
		
	def post(self, request, *args, **kwargs):
		form = self.form(request.POST)
		rform = self.rform(request.POST)
		if 'contact' in request.POST:
			if rform.is_valid():
				cleaned = rform.cleaned_data
				username = cleaned['username']
				email = cleaned['email']
				password = cleaned['password']
				dob = cleaned['dob']
				gender = cleaned['gender']
				contact = cleaned['contact']
				recorded = RegistrationForm.register(username, email, password)
				if recorded:
					pi = RegPi.pied(username, email, dob, gender, contact)
					if pi:
						misc = Miscer.misced(username)
						if misc:
							return JsonResponse({"success": True, "message": "Congratulations! User has been created."})
			return JsonResponse({'success': False, 'message': "Error! User with same email or username exists. Change credentials and Try again."})

		if 'logid' in request.POST:
			if form.is_valid():
				print("aatle")
				cleaned = form.cleaned_data
				username = cleaned['username']
				password = cleaned['password']
				cookie = cleaned['cookie']
				print(username, password)
				user = authenticate(username=username, password=password)
				print(user)
				if user:
					print('aithed')
					auth_login(request, user)
					user_in_session = create_session(request, username)
					info_in_session = create_session_rest(request, username)
					if cookie == 'yes':
						request.session.set_expiry(0)
					else:
						request.session.set_expiry(3600)
					if user_in_session and info_in_session:
						print("got sess")
						misc = Miscer.miscZ(username)
						if misc:
							print("miscing")
							return JsonResponse({"success": True, "url": 'about/about_fill/'})	
						return JsonResponse({"success": True, "url": 'story/'})
				return JsonResponse({"success": False})







def create_session(request, username):
	user = User.objects.get(username=username)
	if user:
		print('user_in_session')
		request.session['username'] = user.username
		return True
	return False

def create_session_rest(request, username):
	user = User.objects.get(username=username)
	if user:
		pi = Pi.objects.get(username=username)
		print(pi)
		print(user)
		request.session['userpic'] = str(pi.profilepic)
		request.session['firstname'] = str(user.first_name)
		request.session['lastname'] = str(user.last_name)
		print(request.session['userpic'])
		return True
	return False

def check_session_valid(request):
	if request.session.has_key('username'):
		username = request.session['username']
		if (User.objects.get(username=username)):
			return True
	return False

	
class LogoutPageView(TemplateView):

	def get(self, request, *args, **kwargs):
	
		logout(request)
		
		return HttpResponseRedirect(reverse('about'))



def save_uploaded_file_to_media_root(f):
    with open('%s%s' % (settings.MEDIA_ROOT,f.name), 'wb+') as destination:
        for chunk in f.chunks():
            destination.write(chunk)

class TestPageView(TemplateView):
	template_name = 'test.html'

	def get(self, request, *args, **kwargs):
		print(request.GET)
		trip_list = Trip.objects.all()
		trip_filter = TripSearchFilter(request.GET, queryset=trip_list)
		context = {'filter': trip_filter}
		return render(request, self.template_name, context)

	def post(self, request, *args, **kwargs):
		return render(request, self.template_name, context=None)

class RootHandler(TemplateView):

	def rooter(username, files):
		#print(files)
		form = ProfileForm
		form = form(files)
		#print(thisform)
		if form.is_valid():
			pi = Pi.objects.get(username=username)
			if 'coverpic' in files:
				cleaned = form.cleaned_data
				cover = files['coverpic']
				pi.coverpic = cover
				pi.save()
				return False
			if 'profilepic' in files:
				profile = files['profilepic']
				pi.profilepic = profile
				pi.save()
				return profile
		else:
			print("no root to shoot")

class AboutPageView(TemplateView):
	template_name = 'about.html'
	form = AboutEditForm
	rootform = ProfileForm
	initials = ''

	def get(self, request, *args, **kwargs):
		initials = GetInitial.initial(request.session['username'])
		form = self.form(initial=initials)
		rootform = self.rootform(initial="")
		profilepic_init = ProfileRoot.img(request.session['username'])
		coverpic_init = ProfileRoot.covimg(request.session['username'])
		context = {'form': form, "rootform": rootform, 'initials': initials, 'username': request.session['username'], 'userpic': request.session['userpic'], 'firstname': request.session['firstname'], 'lastname': request.session['lastname']}

		return render(request, self.template_name, context)

	def post(self, request, *args, **kwargs):
		profile = RootHandler.rooter(request.session['username'], request.FILES)
		initials = GetInitial.initial(request.session['username'])
		form = self.form(initial=initials)
		rootform = self.rootform(initial='')
		context = {'form': form, 'rootform': rootform, 'initials': initials, 'username': request.session['username'], 'userpic': request.session['userpic'], 'firstname': request.session['firstname'], 'lastname': request.session['lastname']}
		return render(request, self.template_name, context)


class AboutFillPageView(TemplateView):
	template_name = 'about_fill.html'
	form = AboutEditForm
	initials = ''

	def get(self, request, *args, **kwargs):
		if check_session_valid:
			context = {}
			initial = GetInitial.initial(request.session['username'])
			form = self.form(initial=initial)
			misc = Misc.objects.get(username=request.session['username'])
			context['userpic'] = request.session['userpic']
			context['username'] = request.session['username']
			context['form'] = form
			return render(request, self.template_name, context)

	def post(self, request, *args, **kwargs):
		form = self.form(request.POST)
		username = request.session['username']
		print(form)
		if form.is_valid():
			print('valid')
			cleaned = form.cleaned_data
			aboutme = cleaned['aboutme']
			dayz = cleaned['dayz']
			monthz = cleaned['monthz']
			yearz = cleaned['yearz']
			birthplace = cleaned['birthplace']
			livesin = cleaned['livesin']
			occupation = cleaned['occupation']
			gender = cleaned['gender']
			relationstatus = cleaned['relationstatus']
			website = cleaned['website']
			mobile = cleaned['mobile']
			travelledplaces = cleaned['travelledplaces']
			dreamplaces = cleaned['dreamplaces']
			favtravplaces = cleaned['favtravplaces']
			favtravseasons = cleaned['favtravseasons']
			favtravmoto = cleaned['favtravmoto']
			favtravmode = cleaned['favtravmode']
			hobbies = cleaned['hobbies']
			skills = cleaned['skills']
			interests = cleaned['interests']
			school = cleaned['school']
			college = cleaned['college']
			aded = cleaned['aded']
			currwork = cleaned['currwork']
			prevwork = cleaned['prevwork']
			workskills = cleaned['workskills']
			facebook = cleaned['facebook']
			twitter = cleaned['twitter']
			instagram = cleaned['instagram']
			saved = AboutEditForm.do_update(username, aboutme, dayz, monthz, yearz, birthplace, livesin, occupation, gender, relationstatus, website, mobile, travelledplaces, dreamplaces, favtravplaces, favtravseasons, favtravmoto, favtravmode, hobbies, skills, interests, school, college, aded, currwork, prevwork, workskills, facebook, twitter, instagram)
			if saved:
				misc = Misc.objects.get(username=username)
				misc.flog = 1
				misc.save()
			return JsonResponse({'success': True})
		else:
			print('failed')
			return JsonResponse({'success':False})
		



class AlbumPageView(TemplateView):
	template_name = 'album.html'
	rootform = ProfileForm
	initials = ''

	def get(self, request, *args, **kwargs):
		rootform = self.rootform(initial='')
		initials = GetInitial.initial(request.session['username'])
		context = {'rootform': rootform, 'initials': initials, 'username': request.session['username'], 'userpic': request.session['userpic'], 'firstname': request.session['firstname'], 'lastname': request.session['lastname']}
		return render(request, self.template_name, context)

	def post(self, request, *args, **kwargs):
		RootHandler.rooter(request.session['username'], request.FILES)
		rootform = self.rootform(initial='')
		initials = GetInitial.initial(request.session['username'])
		context = {'rootform': rootform, 'initials': initials, 'username': request.session['username'], 'userpic': request.session['userpic'], 'firstname': request.session['firstname'], 'lastname': request.session['lastname']}
		return render(request, self.template_name, context)


class ContributePageView(TemplateView):
	template_name = 'contribute.html'
	form = ContributeForm

	def get(self, request, *args, **kwargs):
		form = self.form()
		return render(request, self.template_name, context={'form': form,"username": request.session['username'], 'userpic': request.session['userpic']})

	def post(self, request, *args, **kwargs):
		print(request.POST)
		form = self.form(request.POST, request.FILES)
		print(request.FILES)
		if form.is_valid():
			cleaned = form.cleaned_data
			photo = request.FILES['photo']
			video = request.FILES['video']
			recorded = ContributeForm.save_record(request.session['username'], request.POST, photo, video)
		else:
			print('invalid form')
		return render(request, self.template_name, context={'form': form, "username": request.session['username'], 'userpic': request.session['userpic']})


class EmergencyPageView(TemplateView):
	template_name = 'emergency.html'

	def get(self, request, *args, **kwargs):
		context = {"username": request.session['username'], 'userpic': request.session['userpic']}
		return render(request, self.template_name, context)

	def post(self, request, *args, **kwargs):
		context = {"username": request.session['username'], 'userpic': request.session['userpic']}
		return render(request, self.template_name, context)


class EmergencyRequestPageView(TemplateView):
	template_name = 'emergency_request.html'

	def get(self, request, *args, **kwargs):
		context = {"username": request.session['username'], 'userpic': request.session['userpic']}
		return render(request, self.template_name, context)

	def post(self, request, *args, **kwargs):
		context = {"username": request.session['username'], 'userpic': request.session['userpic']}
		return render(request, self.template_name, context)


class EventMainPageView(TemplateView):
	template_name = 'event_main.html'

	def get(self, request, *args, **kwargs):
		context = {"username": request.session['username'], 'userpic': request.session['userpic']}
		return render(request, self.template_name, context)

	def post(self, request, *args, **kwargs):
		context = {"username": request.session['username'], 'userpic': request.session['userpic']}
		return render(request, self.template_name, context)


class FeedbackPageView(TemplateView):
	template_name = 'feedback.html'
	
	def get(self, request, *args, **kwargs):
		context = {"username": request.session['username'], 'userpic': request.session['userpic']}
		return render(request, self.template_name, context)

	def post(self, request, *args, **kwargs):
		context = {"username": request.session['username'], 'userpic': request.session['userpic']}
		recorded = FeedbackForm.save_feedback(request.session['username'], request.POST)
		if recorded:
			return JsonResponse({'success': True})
		return render(request, self.template_name, context)


class FriendsPageView(TemplateView):
	template_name = 'friends.html'
	rootform = ProfileForm
	initials = ''

	def get(self, request, *args, **kwargs):
		userpic, username = UserInfo.get_user(request.session['username'])
		rootform = self.rootform(initial='')
		initials = GetInitial.initial(request.session['username'])
		context = {'rootform': rootform, 'initials': initials, "username": request.session['username'], 'userpic': request.session['userpic']}
		return render(request, self.template_name, context)

	def post(self, request, *args, **kwargs):
		RootHandler.rooter(request.session['username'], request.FILES)
		rootform = self.rootform(initial='')
		initials = GetInitial.initial(request.session['username'])
		context = {'rootform': rootform, 'initials': initials,"username": request.session['username'], 'userpic': request.session['userpic']}
		return render(request, self.template_name, context)


class MyEventPageView(TemplateView):
	template_name = 'myevent.html'

	def get(self, request, *args, **kwargs):
		context = {}
		parameter = (request.GET.get('ownership'))
		context['username'] = request.session['username']
		context['userpic'] = request.session['userpic']
		event_contents_list = Bifurcator.getEventContents(request.session['username'], parameter)
		print(event_contents_list)
		context['event_contents_list'] = event_contents_list
		return render(request, self.template_name, context)

	def post(self, request, *args, **kwargs):
		context = {}
		event_list = Event.objects.all()
		event_filter = EventSearchFilter(request.GET, queryset=event_list)
		context['filters'] = event_filter
		records_list, ids_list = MyEventForm.form_base(request.session['username'])
		context['ids_list'] = ids_list
		context['username'] = request.session['username']
		context['userpic'] = request.session['userpic']
		return render(request, self.template_name, context)


class MyTripPageView(TemplateView):
	template_name = 'mytrip.html'

	def get(self, request, *args, **kwargs):
		context = {}
		parameter = (request.GET.get('ownership'))
		context['username'] = request.session['username']
		context['userpic'] = request.session['userpic']
		trip_contents_list = Bifurcator.getTripContents(request.session['username'], parameter)
		context['trip_contents_list'] = trip_contents_list
		return render(request, self.template_name, context)

	def post(self, request, *args, **kwargs):
		context = {}
		context['username'] = request.session['username']
		context['userpic'] = request.session['userpic']
		return render(request, self.template_name, context)

#Plan Trip Class-View
class PlanTripPageView(TemplateView):
	template_name = 'plan_trip.html'
	
	def get(self, request, *args, **kwargs):
		context = {}
		context['username'] = request.session['username']
		context['userpic'] = request.session['userpic']
		return render(request, self.template_name, context)

	def post(self, request, *args, **kwargs):
		context = {}
		context['username'] = request.session['username']
		context['userpic'] = request.session['userpic']
		username = request.session['username']
		valid = TripPlanValidation.validate(request.POST, username)
		if valid:
			redirect_url = '../mytrip/'
			return JsonResponse({"success": True, 'redirect_url': redirect_url })
		return render(request, self.template_name, context)


class PlanEventPageView(TemplateView):
	template_name = 'plan_event.html'
	form = EventPlanForm

	def get(self, request, *args, **kwargs):
		context = {}
		context['username'] = request.session['username']
		context['userpic'] = request.session['userpic']
		form = self.form()
		context['form'] = form
		#print(form)
		return render(request, self.template_name, context)

	def post(self, request, *args, **kwargs):
		context = {}
		context['username'] = request.session['username']
		context['userpic'] = request.session['userpic']
		form = self.form(request.POST, request.FILES)
		print(request.FILES)
		if form.is_valid():
			cleaned = form.cleaned_data
			#logo = cleaned['logo']
			#cover = cleaned['cover']
			logo = request.FILES['logo']
			cover = request.FILES['cover']
			recorded = EventPlanForm.validation(request.session['username'], logo, cover, request.POST)
			if recorded:
				print(recorded)
				redirect_url = '../myevent/'
				return HttpResponseRedirect(reverse('myevent'))
			else:
				print(False)
		else:
			print(False)
		context['form'] = self.form
		return render(request, self.template_name, context)

class ProfileSettingsPageView(TemplateView):
	template_name = 'settings.html'

	def get(self, request, *args, **kwargs):
		context = {}
		context['username'] = request.session['username']
		context['userpic'] = request.session['userpic']
		return render(request, self.template_name, context)

	def post(self, request, *args, **kwargs):
		context = {}
		context['username'] = request.session['username']
		context['userpic'] = request.session['userpic']
		return render(request, self.template_name, context)


class ReportsPageView(TemplateView):
	template_name = 'reports.html'

	def get(self, request, *args, **kwargs):
		context = {}
		context['username'] = request.session['username']
		context['userpic'] = request.session['userpic']
		records_list, users_list, trips_list, events_list = ReportForm.get_records()
		context = {'records_list': records_list, "users_list": users_list, 'trips_list': trips_list, 'events_list': events_list}
		return render(request, self.template_name, context)

	def post(self, request, *args, **kwargs):
		context = {}
		context['username'] = request.session['username']
		context['userpic'] = request.session['userpic']
		return render(request, self.template_name, context)



class SearchEventPageView(TemplateView):
	template_name = 'search_event.html'

	def get(self, request, *args, **kwargs):
		context = {}
		context['username'] = request.session['username']
		context['userpic'] = request.session['userpic']
		event_list = Event.objects.all().order_by('created_on')
		event_filter = EventSearchFilter(request.GET, queryset=event_list)
		context['filters'] = event_filter
		records_list, ids_list = MyEventForm.form_base(request.session['username'])
		context['ids_list'] = ids_list
		#print(context)
		return render(request, self.template_name, context)

	def post(self, request, *args, **kwargs):
		context = {}
		context['username'] = request.session['username']
		context['userpic'] = request.session['userpic']
		event_list = Event.objects.all().order_by('created_on')
		event_filter = EventSearchFilter(request.GET, queryset=event_list)
		context['filters'] = event_filter
		records_list, ids_list = MyEventForm.form_base(request.session['username'])
		context['ids_list'] = ids_list
		print(request.POST)
		joined = JoinEvent.join(request.session['username'], request.POST)
		if joined:
			print('joined')
			return JsonResponse({"success": True})
		print('failed')
		return JsonResponse({"success": False})
		#return render(request, self.template_name, context)


class SearchTripPageView(TemplateView):
	template_name = 'search_trip.html'

	def get(self, request, *args, **kwargs):
		context = {}
		context['username'] = request.session['username']
		context['userpic'] = request.session['userpic']
		trip_list = Trip.objects.all().order_by('created_on')
		trip_filter = TripSearchFilter(request.GET, queryset=trip_list)
		context['filters'] = trip_filter
		records_list, ids_list = MyTripForm.form_base(request.session['username'])
		context['ids_list'] = ids_list
		#print(context)
		return render(request, self.template_name, context)

	def post(self, request, *args, **kwargs):
		context = {}
		context['username'] = request.session['username']
		context['userpic'] = request.session['userpic']
		trip_list = Trip.objects.all().order_by('created_on')
		trip_filter = TripSearchFilter(request.GET, queryset=trip_list)
		context['filters'] = trip_filter
		records_list, ids_list = MyTripForm.form_base(request.session['username'])
		context['ids_list'] = ids_list
		print(request.POST)
		joined = JoinTrip.join(request.session['username'], request.POST)
		if joined:
			print('joined')
			return JsonResponse({"success": True})
		print('failed')
		return JsonResponse({"success": False})



class StoryPageView(TemplateView):
	template_name = 'story.html'

	def get(self, request, *args, **kwargs):
		context = {}
		context['username'] = request.session['username']
		context['userpic'] = request.session['userpic']
		return render(request, self.template_name, context)

	def post(self, request, *args, **kwargs):
		context = {}
		context['username'] = request.session['username']
		context['userpic'] = request.session['userpic']
		return render(request, self.template_name, context)


class TimelinePageView(TemplateView):
	template_name = 'timeline.html'
	rootform = ProfileForm
	initials = ''


	def get(self, request, *args, **kwargs):
		username_list = Listing.username_lister()
		rootform = self.rootform(initial='')
		initials = GetInitial.initial(request.session['username'])
		context = {'rootform': rootform, 'initials': initials, 'username': request.session['username'], 'userpic': request.session['userpic'], 'firstname': request.session['firstname'], 'lastname': request.session['lastname'], 'ulist': username_list}
		return render(request, self.template_name, context)

	def post(self, request, *args, **kwargs):
		RootHandler.rooter(request.session['username'], request.FILES)
		rootform = self.rootform(initial='')
		initials = GetInitial.initial(request.session['username'])
		context = {'rootform': rootform, 'initials': initials, 'username': request.session['username'], 'userpic': request.session['userpic'], 'firstname': request.session['firstname'], 'lastname': request.session['lastname']}
		return render(request, self.template_name, context)


class TravellerMainPageView(TemplateView):
	template_name = 'traveller_main.html'

	def get(self, request, *args, **kwargs):
		context = {}
		context['username'] = request.session['username']
		context['userpic'] = request.session['userpic']
		return render(request, self.template_name, context)

	def post(self, request, *args, **kwargs):
		context = {}
		context['username'] = request.session['username']
		context['userpic'] = request.session['userpic']
		return render(request, self.template_name, context)

