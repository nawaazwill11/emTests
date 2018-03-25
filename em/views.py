from django.shortcuts import render
from django.views.generic import TemplateView
from .models import Login
from django.http import HttpResponseRedirect, HttpResponsePermanentRedirect 
from django.core.exceptions import ValidationError
from django.core.urlresolvers import reverse
from .mods.forms import LoginForm
from django.contrib.auth.decorators import login_required, permission_required

class TestPageView(TemplateView):
	template_name = 'test/test1.html'
	form = LoginForm
	#@login_required
	def get(self, request, *args, **kwargs):
		form = self.form(initial='')
		return render(request, self.template_name, {'form': form})

	def post(self, request, **kwargs):
		form = self.form(request.POST)
		if form.is_valid():
			return HttpResponseRedirect('timeline')
		return render(request, 'test/test1.html', {'form': form})

class AboutPageView(TemplateView):
	template_name = 'about.html'

	def get(self, request, **kwargs):
		return render(request, self.template_name, context=None)

class EmergencyPageView(TemplateView):
	template_name = 'emergency.html'

	

def index(request):
	return render(request, 'index.html', context=None)

def about(request):
	return render(request,'about.html', context=None)

def album(request):
	return render(request, 'album.html', context=None)

def contribute(request):
	return render(request, 'contribute.html', context=None)

def emergency(request):
	return render(request, 'emergency.html', context=None)

def emergency_request(request):
	return render(request, 'emergency_requests.html', context=None)

def event_main(request):
	return render(request, 'event_main.html', context=None)

def feedback(request):
	return render(request, 'feedback.html', context=None)

def friends(request):
	return render(request, 'friends.html', context=None)

def myevent(request):
	return render(request, 'myevent.html', context=None)

def mytrip(request):
	return render(request, 'mytrip.html', context=None)

def plan_event(request):
	return render(request, 'plan_event.html', context=None)

def plan_trip(request):
	return render(request, 'plan_trip.html', context=None)

def search_trip(request):
	return render(request, 'search_trip.html', context=None)

def search_event(request):
	return render(request, 'search_event.html', context=None)

def setting(request):
	return render(request, 'settings.html', context=None)

def story(request):
	return render(request, 'story.html', context=None)

def timeline(request):
	return render(request, 'timeline.html', context=None)

def traveller_main(request):
	return render(request, 'traveller_main.html', context=None)