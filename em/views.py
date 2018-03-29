from django.contrib.auth.decorators import login_required, permission_required
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, logout
from django.contrib.auth import login as auth_login 
from django.core.exceptions import ValidationError
from django.core import serializers
from django.contrib.sessions.models import Session
from django.core.urlresolvers import reverse
from django.http import HttpResponseRedirect, HttpResponsePermanentRedirect, JsonResponse
from django.shortcuts import render
from django.views.generic import TemplateView
from .models import Login
from .mods.forms import LoginForm, RegistrationForm, Printer
from .mods.test import SharingForm
import re

def save_uploaded_file_to_media_root(f):
    with open('%s%s' % (settings.MEDIA_ROOT,f.name), 'wb+') as destination:
        for chunk in f.chunks():
            destination.write(chunk)

class TestPageView(TemplateView):
	template_name = 'test/test1.html'
	form = LoginForm

	def get(self, request, *args, **kwargs):
		form = self.form(initial='')
		return render(request, self.template_name, {'form': form})

	def post(self, request, *args, **kwargs):
		form = self.form(request.POST)
		if form.is_valid():
			return JsonResponse({'success':True})
		return render(request, self.template_name, context=None)


class IndexPageView(TemplateView):
	template_name = 'index.html'
	form = LoginForm
	rform = RegistrationForm

	def get(self, request, *args, **kwargs):
		if request.session.has_key('username'):
			return HttpResponseRedirect('story/')
		form = self.form(initial='')
		rform  = self.rform(initial='')
		#Printer.print(rform)
		return render(request, self.template_name, {'form': form,'rform': rform})
		
	def post(self, request, *args, **kwargs):
		form = self.form(request.POST)
		rform = self.rform(request.POST)
		check_user_form = re.search(r'^\w+', form['username'].value(), re.I)
		
		if 'contact' in request.POST:
			if rform.is_valid():
				cleaned = rform.cleaned_data
				username = cleaned['username']
				email = cleaned['email']
				password = cleaned['password']
				repassword = cleaned['repassword']
				contact = cleaned['contact']
				recorded = RegistrationForm.register(username, email, password, repassword, contact)
				if 'True' in recorded.values():
					return JsonResponse(recorded)
				else:
					return JsonResponse(recorded)
					error = recorded['error']
					return render(request, self.template_name, {'error': error })
			return render(request, self.template_name, {'form': form,'rform': rform})
	#			return HttpResponseRedirect(template_name)

		else:
			if form.is_valid():
				cleaned = form.cleaned_data
				username = cleaned['username']
				password = cleaned['password']
				user = authenticate(request, username=username, password=password)
				#l = LoginForm.loginauth(user)
				if user is not None:				
					in_session = create_session(request, username)
					if in_session:
						l = LoginForm.loginauth(in_session)
						auth_login(request, user)
						next_url = request.GET.get('next')
						user 
						if next_url:
							redirect_url = next_url[4:]
						else:
							redirect_url = 'story/'
						return JsonResponse({'success':True, 'url': redirect_url})
				else:
					raise ValidationError('nope')
			return render(request, self.template_name, context=None)




def create_session(request, username):
	user = User.objects.get(username=username)
	if user:
		request.session['username'] = user.username
		return True
	return False


def check_session_valid(request):
	if request.session.has_key('username'):
		username = request.session['username']
		if (User.objects.get(username=username)):
			return True
	return False

	
def logout_page (request):
	#user = User.objects.get(username=request.session['username'])
	if logout(request):
		logout(request)
	if request.session.has_key('username'):
		del request.session['username']
	
	return HttpResponsePermanentRedirect('../')

	'''def get(request):
					logout(request)
					return HttpResponsePermanentRedirect('../')'''




class AboutPageView(TemplateView):
	template_name = 'about.html'

	def get(self, request, *args, **kwargs):
		return render(request, self.template_name, context=None)

	def post(self, request, *args, **kwargs):
		return render(request, self.template_name, context=None)


class AlbumPageView(TemplateView):
	template_name = 'album.html'

	def get(self, request, *args, **kwargs):
		return render(request, self.template_name, context=None)

	def post(self, request, *args, **kwargs):
		return render(request, self.template_name, context=None)


class ContributePageView(TemplateView):
	template_name = 'contribute.html'

	def get(self, request, *args, **kwargs):
		return render(request, self.template_name, context=None)

	def post(self, request, *args, **kwargs):
		return render(request, self.template_name, context=None)


class EmergencyPageView(TemplateView):
	template_name = 'emergency.html'

	def get(self, request, *args, **kwargs):
		return render(request, self.template_name, context=None)

	def post(self, request, *args, **kwargs):
		return render(request, self.template_name, context=None)


class EmergencyRequestPageView(TemplateView):
	template_name = 'emergency_request.html'

	def get(self, request, *args, **kwargs):
		return render(request, self.template_name, context=None)

	def post(self, request, *args, **kwargs):
		return render(request, self.template_name, context=None)


class EventMainPageView(TemplateView):
	template_name = 'event_main.html'

	def get(self, request, *args, **kwargs):
		return render(request, self.template_name, context=None)

	def post(self, request, *args, **kwargs):
		return render(request, self.template_name, context=None)


class FeedbackPageView(TemplateView):
	template_name = 'feedback.html'

	def get(self, request, *args, **kwargs):
		return render(request, self.template_name, context=None)

	def post(self, request, *args, **kwargs):
		return render(request, self.template_name, context=None)


class FriendsPageView(TemplateView):
	template_name = 'friends.html'

	def get(self, request, *args, **kwargs):
		return render(request, self.template_name, context=None)

	def post(self, request, *args, **kwargs):
		return render(request, self.template_name, context=None)


class MyEventPageView(TemplateView):
	template_name = 'myevent.html'

	def get(self, request, *args, **kwargs):
		return render(request, self.template_name, context=None)

	def post(self, request, *args, **kwargs):
		return render(request, self.template_name, context=None)


class MyTripPageView(TemplateView):
	template_name = 'mytrip.html'

	def get(self, request, *args, **kwargs):
		return render(request, self.template_name, context=None)

	def post(self, request, *args, **kwargs):
		return render(request, self.template_name, context=None)


class PlanEventPageView(TemplateView):
	template_name = 'plan_event.html'

	def get(self, request, *args, **kwargs):
		return render(request, self.template_name, context=None)

	def post(self, request, *args, **kwargs):
		return render(request, self.template_name, context=None)


class PlanTripPageView(TemplateView):
	template_name = 'plan_trip.html'

	def get(self, request, *args, **kwargs):
		return render(request, self.template_name, context=None)

	def post(self, request, *args, **kwargs):
		return render(request, self.template_name, context=None)

class SearchEventPageView(TemplateView):
	template_name = 'search_event.html'

	def get(self, request, *args, **kwargs):
		return render(request, self.template_name, context=None)

	def post(self, request, *args, **kwargs):
		return render(request, self.template_name, context=None)


class SearchTripPageView(TemplateView):
	template_name = 'search_trip.html'

	def get(self, request, *args, **kwargs):
		return render(request, self.template_name, context=None)

	def post(self, request, *args, **kwargs):
		return render(request, self.template_name, context=None)


class ProfileSettingsPageView(TemplateView):
	template_name = 'settings.html'

	def get(self, request, *args, **kwargs):
		return render(request, self.template_name, context=None)

	def post(self, request, *args, **kwargs):
		return render(request, self.template_name, context=None)

class StoryPageView(TemplateView):
	template_name = 'story.html'

	def get(self, request, *args, **kwargs):
		return render(request, self.template_name, context=None)

	def post(self, request, *args, **kwargs):
		return render(request, self.template_name, context=None)


class TimelinePageView(TemplateView):
	template_name = 'timeline.html'

	def get(self, request, *args, **kwargs):
		return render(request, self.template_name, context=None)

	def post(self, request, *args, **kwargs):
		return render(request, self.template_name, context=None)


class TravellerMainPageView(TemplateView):
	template_name = 'traveller_main.html'

	def get(self, request, *args, **kwargs):
		return render(request, self.template_name, context=None)

	def post(self, request, *args, **kwargs):
		return render(request, self.template_name, context=None)

