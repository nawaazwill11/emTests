from em.models import Trip, Event
import django_filters
from django_filters.filters import CharFilter, ChoiceFilter, MultipleChoiceFilter, NumberFilter
from django import forms
from django.db import models




class TripSearchFilter(django_filters.FilterSet):
	dayslist = [(str(i),'0'+str(i)) for i in [i for i in range(1,10)]] + [(str(i),str(i)) for i in [i for i in range(10,32)]]
	monthslist =  [(1,'Jan'), (2,'Feb'), (3,'Mar'), (4,'Apr'), (5,'May'), (6,'Jun'), (7,'Jul'), (8,'Aug'), (9,'Sep'), (10,'Oct'), (11,'Nov'), (12,'Dec')]
	yearslist = [(i, i) for i in range(2018,2050)]
	source = django_filters.CharFilter(label="Source:", lookup_expr='icontains', widget=forms.TextInput(attrs={}))
	destination = django_filters.CharFilter(label="Destination:", lookup_expr='icontains')
	company = ChoiceFilter(choices=[('Group','Group'), ('Solo','Solo')], widget=forms.Select() )
	moto = ChoiceFilter(label='Travel Moto',choices=[('','Any'), ('Adventure','Adventure'), ('Exploring','Exploring'), ('Photography','Photography'), ('Sports Event','Sports Event'), ('Food & Cuisine','Food & Cuisine'), ('Fitness','Fitness'), ('Shopping','Shopping'), ('Travel Blogging','Travel Blogging'), ('Partying','Partying'), ('Backtracking','Backtracking')], widget=forms.Select() )
	mode = ChoiceFilter(choices=[('Car','Car'), ('Motorbike','Motorbike'), ('Cycle','Cycle'), ('On-Foot','On-Foot'), ('Any', 'Any') ], widget=forms.Select() )
	year = NumberFilter(label='Start Date', name='start_date',lookup_expr='year', widget=forms.NumberInput(attrs={'class': 'search_inputs', 'placeholder': 'Year'}) )
	month = NumberFilter(label='Start Date', name='start_date',lookup_expr='month', widget=forms.NumberInput(attrs={'class': 'search_inputs', 'placeholder': 'Month'}) )
	day = NumberFilter(label='Start Date', name='start_date',lookup_expr='day', widget=forms.NumberInput(attrs={'class': 'search_inputs', 'placeholder': 'Day'}) )
	age_group = ChoiceFilter(choices=[('Under 18','Under 18'), ('18-30','18-30'), ('30-50','30-50'), ('Above 50','Above 50')], widget=forms.Select(), lookup_expr="icontains", label='Age Group' )
	#year = ChoiceFilter(name='start_date',choices=yearslist, widget=forms.Select(attrs={'class': 'search_inputs'}) )
	#start_date = django_filters.NumberFilter(name='start_date', lookup_expr='year')
	ownership = MultipleChoiceFilter(choices=[('admin','Created'), ('joined',' Joined')], widget=forms.CheckboxSelectMultiple )
	location = ChoiceFilter(choices=[('male','Male'), ('female','Female'), ('others','Others'), ('any','Any')], widget=forms.Select())
	gender = ChoiceFilter(choices=[('male','Male'), ('female','Female'), ('others','Others'), ('Any', 'Any')], widget=forms.Select(attrs={'class': 'selects'}))

	class Meta:
		model = Trip
		fields = ['ownership']
		#fields = ['username', 'trip_id', 'company', 'moto', 'destination', 'fuel', 'vehicle', 'hotel', 'total', 'start_date', 'gender', 'age_group', 'participants', 'title', 'description', 'pitstops', 'pitstops_time', 'source', 'destination', 'timeperpit','distance', 'duration', 'created_on', 'is_published',]

class EventSearchFilter(django_filters.FilterSet):
	ownership = MultipleChoiceFilter(choices=[('admin','Created'), ('joined',' Joined')], widget=forms.CheckboxSelectMultiple )
	location = ChoiceFilter(name='location',choices=[('Venue','Venue'), ('Online','Online')], widget=forms.Select(attrs={'class': 'selects'}))
	city = CharFilter(name="city", lookup_expr="icontains", widget=forms.TextInput(attrs={'placeholder': 'City'}))
	state = CharFilter(name="state", lookup_expr="icontains", widget=forms.TextInput(attrs={'placeholder': 'State'}))
	country = CharFilter(name="india", lookup_expr="icontains", widget=forms.TextInput(attrs={'placeholder': 'India'}))
	category = ChoiceFilter(name="category",choices=[('Adventure','Adventure'), ('Business & Tech','Business & Tech'), ('Entertainment','Entertainment'), ('Social','Social'), ('Sports','Sports'), ('Talks','Talks')], widget=forms.Select(attrs={'class': 'selects'}))
	gender = ChoiceFilter(name='gender',choices=[('Male','Male'), ('Female','Female'), ('Others','Others'), ('Any', 'Any')], widget=forms.Select(attrs={'class': 'selects'}))
	age_group = ChoiceFilter(name='age',choices=[('Under 18','Under 18'), ('18-30','18-30'), ('30-50','30-50'), ('Above 50','Above 50')], widget=forms.Select(), lookup_expr="icontains", label='Age Group')
	year = NumberFilter(label='Start Date', name='start_date',lookup_expr='year', widget=forms.NumberInput(attrs={'class': 'form_inps', 'placeholder': 'Year'}) )
	month = NumberFilter(label='Start Date', name='start_date',lookup_expr='month', widget=forms.NumberInput(attrs={'class': 'form_inps', 'placeholder': 'Month'}) )
	day = NumberFilter(label='Start Date', name='start_date',lookup_expr='day', widget=forms.NumberInput(attrs={'class': 'form_inps', 'placeholder': 'Day'}) )
	class Meta:
		model = Event
		fields = ['ownership']