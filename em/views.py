from django.shortcuts import render
from django.views.generic import TemplateView
from .models import Login
from django.http import HttpResponseRedirect, HttpResponsePermanentRedirect, JsonResponse
from django.core.exceptions import ValidationError
from django.core.urlresolvers import reverse
from .mods.forms import LoginForm
from .mods.test import SharingForm
from django.contrib.auth.decorators import login_required, permission_required
from django.contrib.auth.models import User
from django.contrib.auth import authenticate
from django.contrib.auth import login as auth_login 

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

	def get(self, request, *args, **kwargs):
		form = self.form(initial='')
		return render(request, self.template_name, {'form': form})

	def post(self, request, *args, **kwargs):
		form = self.form(request.POST)
		if form.is_valid():
			cleaned = form.cleaned_data
			username = cleaned['username']
			password = cleaned['password']
			user = authenticate(request, username=username, password=password)
			#l = LoginForm.loginauth(user)
			if user is not None:				
				auth_login(request, user)
			#	return render(request, 'about.html', context=None)
				return JsonResponse({'success':True})
			else:
				raise ValidationError('nope')
		return render(request, self.template_name, context=None)








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

