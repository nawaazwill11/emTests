from em.models import Trip, Event
import django_filters
from django_filters.filters import ChoiceFilter, MultipleChoiceFilter
from django import forms



class TripSearchFilter(django_filters.FilterSet):
	dayslist = [(str(i),'0'+str(i)) for i in [i for i in range(1,10)]] + [(str(i),str(i)) for i in [i for i in range(10,32)]]
	monthslist =  [('01','Jan'), ('02','Feb'), ('03','Mar'), ('04','Apr'), ('05','May'), ('06','Jun'), ('07','Jul'), ('08','Aug'), ('09','Sep'), ('10','Oct'), ('11','Nov'), ('12','Dec')]
	YEARS_LIST = [(i, i) for i in range(1930,2004)]
	source = django_filters.CharFilter(label="Source:", lookup_expr='icontains', widget=forms.TextInput(attrs={}))
	destination = django_filters.CharFilter(label="Destination:", lookup_expr='icontains')
	company = ChoiceFilter(choices=[('Group','Group'), ('Solo','Solo')], widget=forms.Select() )
	moto = ChoiceFilter(label='Travel Moto',choices=[('','Any'), ('Adventure','Adventure'), ('Exploring','Exploring'), ('Photography','Photography'), ('Sports Event','Sports Event'), ('Food & Cuisine','Food & Cuisine'), ('Fitness','Fitness'), ('Shopping','Shopping'), ('Travel Blogging','Travel Blogging'), ('Partying','Partying'), ('Backtracking','Backtracking')], widget=forms.Select() )
	mode = ChoiceFilter(choices=[('Car','Car'), ('Motorbike','Motorbike'), ('Cycle','Cycle'), ('On-Foot','On-Foot')], widget=forms.Select() )
	start_date = ChoiceFilter(label='Start Date',lookup_expr='year',choices=YEARS_LIST, widget=forms.TextInput(attrs={'class': 'search_inputs'}) )
	start_date = ChoiceFilter(lookup_expr='month',choices=monthslist, widget=forms.Select(attrs={'class': '.search_inputs'}) )
	ownership = MultipleChoiceFilter(choices=[('admin','Created'), ('joined',' Joined')], widget=forms.CheckboxSelectMultiple )
	start_date = django_filters.NumberFilter(name='start_date', lookup_expr='year')
	location = ChoiceFilter(choices=[('male','Male'), ('female','Female'), ('others','Others'), ('any','Any')], widget=forms.Select())
	gender = ChoiceFilter(choices=[('male','Male'), ('female','Female'), ('others','Others'), ('any','Any')], widget=forms.Select())

	class Meta:
		model = Trip
		fields = ['ownership']
		#fields = ['username', 'trip_id', 'company', 'moto', 'destination', 'fuel', 'vehicle', 'hotel', 'total', 'start_date', 'gender', 'age_group', 'participants', 'title', 'description', 'pitstops', 'pitstops_time', 'source', 'destination', 'timeperpit','distance', 'duration', 'created_on', 'is_published',]

class EventSearchFilter(django_filters.FilterSet):
	ownership = MultipleChoiceFilter(choices=[('admin','Created'), ('joined',' Joined')], widget=forms.CheckboxSelectMultiple )
	class Meta:
		model = Event
		fields = ['ownership']