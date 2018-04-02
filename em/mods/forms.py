from django import forms
import re
from em.models import Login, Pi, AuthUser
from django.core.exceptions import ObjectDoesNotExist
from django.contrib.auth.models import User
import datetime
from datetime import datetime as dt


#Using clean_<field_name>. This is the best choice.
class LoginForm(forms.Form):

	username = forms.CharField(required=True, initial='', widget=forms.TextInput(attrs={'id': 'sigin-username', 'class': 'full-width has-padding has-border', 'placeholder': 'Username'}))
	password = forms.CharField(required=True, widget=forms.PasswordInput(attrs={'id': 'sigin-password', 'class': 'full-width has-padding has-border', 'placeholder': 'Password'}))
	logid = forms.CharField(required=False, widget=forms.HiddenInput())

	#image = forms.ImageField(label='Photoo', required=False, widget=forms.ClearableFileInput())
	
	def clean_username(self, *args):
		isclean = (self.cleaned_data['username']).lower()
		user_check = re.search(r'^\d',isclean)
		if user_check:
			message = 'Cannot start username with a digit'
			self.add_error('username', message)
			raise form.ValidationError(message)
		return isclean

	def clean_password(self):
		isclean = self.cleaned_data['password']
		num = re.search(r'[0-9]+', isclean, re.I)
		al =  re.search(r'[a-zA-Z]+', isclean, re.I)
		if not (num and al and len(isclean)>=4):
			message = 'Try a combination of Number and Digits'
			self.add_error('password', message)
			raise forms.ValidationError(message)
		return isclean

	def loginauth(email):
		print(email)

		'''
		try:
			#if (Login.objects.get(email=email, passw=password)):
			#	return True
			
			if (User.objects.filter(email=email).exists()):
				user = authenticate(email=email, password=password)
				
		except ObjectDoesNotExist as e:
			return False
		'''
		


	'''def clean_image(self):
		isclean = self.cleaned_data['image']
		image_valid = re.search(r'(([\w]+).+(?:jpg|jpeg|png)$)', isclean, re.I)
		if not image_valid:
			raise forms.ValidationError('Please Upload a Valid Image (jpg,jpeg or png')
	'''

class RegistrationForm(forms.Form):

	username = forms.CharField(required=True, initial='', widget=forms.TextInput(attrs={'id': 'sigup-username', 'class': 'full-width has-padding has-border', 'placeholder': 'Username'}))
	email = forms.EmailField(required=True, widget=forms.EmailInput(attrs={'id': 'sigup-email', 'class': 'full-width has-padding has-border', 'placeholder': 'Email'}))
	password = forms.CharField(required=True, widget=forms.PasswordInput(attrs={'id': 'sigup-password', 'class': 'full-width has-padding has-border', 'placeholder': 'Password'}))
	repassword = forms.CharField(required=True, widget=forms.PasswordInput(attrs={'id': 'sigup-repassword', 'class': 'full-width has-padding has-border', 'placeholder': 'Re-Enter Password'}))
	contact = forms.RegexField(regex=r'^\d{10}$', max_length=10, required=True, widget=forms.TextInput(attrs={'id': 'sigup-contact', 'class': 'full-width has-padding has-border', 'placeholder': 'Contact Number '}))
	#regid = forms.CharField(required=False, widget=forms.HiddenInput())


	#image = forms.ImageField(label='Photoo', required=False, widget=forms.ClearableFileInput())
	
	def clean_username(self, *args):
		isclean = (self.cleaned_data['username']).lower()
		user_check = re.search(r'^\d',isclean)
		if user_check:
			message = 'Cannot start username with a digit'
			self.add_error('username', message)
			raise form.ValidationError(message)
		return isclean

	def clean_email(self, *args):
		isclean = self.cleaned_data['email']
		email_valid = re.search(r'^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$', isclean, re.I)
		if not email_valid:
			message = 'Invalid Email'
			self.add_error('email', message)
			raise form.ValidationError(message)
		return isclean


	def clean_password(self):
		isclean = self.cleaned_data['password']
		num = re.search(r'[0-9]+', isclean, re.I)
		al =  re.search(r'[a-zA-Z]+', isclean, re.I)
		if not (num and al and len(isclean)>=4):
			message = 'Try a combination of Number and Digits'
			self.add_error('password', message)
			raise forms.ValidationError(message)
		return isclean

	def clean_repassword(self):
		isclean = self.cleaned_data['password']
		num = re.search(r'[0-9]+', isclean, re.I)
		al =  re.search(r'[a-zA-Z]+', isclean, re.I)
		if not (num and al and len(isclean)>=4):
			message = 'Try a combination of Number and Digits'
			self.add_error('repassword', message)
			raise forms.ValidationError(message)
		return isclean


	def clean_contact(self, *args):
		isclean = self.cleaned_data['contact']
		valid = re.search(r'^\d{10}$', isclean)
		if not valid:
			message = 'Incorrect Contact Number'
			self.add_error('contact', message)
			raise forms.ValidationError(message)
		return isclean

	def check_user_exists(username):
		try:
			if (AuthUser.objects.filter(username=username).exists()):
				return AuthUser.objects.get(username=username)
		except ObjectDoesNotExist:
			raise forms.ValidationError('User Exists')

	def check_email_exists(email):
		try:
			if (User.objects.filter(email=email).exists()):
				return True
		except ObjectDoesNotExist:
			raise forms.ValidationError('Email Exists')


	def register(username, email, password, repassword, contact):
		has_user = RegistrationForm.check_user_exists(username)
		has_email = RegistrationForm.check_email_exists(email)
		if not(has_user and has_email):
			user = User(username=username, email=email, password=password)
			user.is_staff = False
			user.set_password(password)
			user.is_superuser = False
			user.is_active = True
			user.save()
			user = User.objects.get(username=username)
			return({'success': True, 'message': 'User\'s up the arse'})
		return({'success': False, 'message': 'Error. Try Again with other credentials.'})

class Printer(forms.Form):

	def print(*args):
		for i in args:
			print(i)

	def img(username):
		pi = Pi.objects.get(username=username)
		ppic = pi.profilepic
		return ppic

	def covimg(username):
		pi = Pi.objects.get(username=username)
		cpic = pi.coverpic
		return cpic




class AboutEditForm(forms.Form):
	dayslist = [(str(i),'0'+str(i)) for i in [i for i in range(1,10)]] + [(str(i),str(i)) for i in [i for i in range(10,32)]]
	monthslist =  [('01','Jan'), ('02','Feb'), ('03','Mar'), ('04','Apr'), ('05','May'), ('06','Jun'), ('07','Jul'), ('08','Aug'), ('09','Sep'), ('10','Oct'), ('11','Nov'), ('12','Dec')]
	yearslist = [(i, i) for i in range(1930,2004)]
	yearslist.reverse()
	aboutme = forms.CharField(required=False, initial='', max_length=160, widget=forms.Textarea(attrs={'rows': '2' ,'placeholder': 'Something about you...' }))
	dayz = forms.ChoiceField(choices=dayslist, required=True, widget=forms.Select(attrs={'class': 'slt'}))
	monthz = forms.ChoiceField(choices=monthslist, required=True, widget=forms.Select(attrs={'class': 'slt'}))
	yearz = forms.ChoiceField(choices=yearslist, required=True, widget=forms.Select(attrs={'class': 'slt'}))
	birthplace = forms.CharField(required=False, max_length=500, widget=forms.TextInput(attrs={'placeholder': 'Eg. Daman, India'}))
	livesin = forms.CharField(required=False, max_length=500, widget=forms.TextInput(attrs={'placeholder': 'Eg. Pune, India'}))
	occupation = forms.CharField(required=False, max_length=500, widget=forms.TextInput(attrs={'placeholder': 'Eg. Programmer'}))
	gender = forms.ChoiceField(choices=[('none',' '), ('male','Male'),('female','Female'),('other','Other')], required=True, widget=forms.Select(attrs={'class': 'slt'}))
	relationstatus = forms.ChoiceField(choices=[('none',' '), ('single','Single'),('relation','In a Relation'),('married','Married')], required=False, widget=forms.Select(attrs={'class': 'slt'}))
	email = forms.EmailField(required=True, widget=forms.EmailInput(attrs={'placeholder': 'Eg. some@mail.com'}))
	website = forms.CharField(required=False, max_length=500, widget=forms.TextInput(attrs={'placeholder': 'Website'}))
	mobile = forms.CharField(required=False, max_length=10, widget=forms.TextInput(attrs={'placeholder': 'Eg. 999990000'}))
	facebook = forms.CharField(required=False, max_length=100, widget=forms.TextInput(attrs={'placeholder': 'https://www.facebook.com/user'}))
	twitter = forms.CharField(required=False, max_length=100, widget=forms.TextInput(attrs={'placeholder': 'https://www.twitter.com/user'}))
	instagram = forms.CharField(required=False, max_length=100, widget=forms.TextInput(attrs={'placeholder': 'https://www.instagram.com/user'}))
	travelledplaces = forms.CharField(required=False, max_length=700, widget=forms.Textarea(attrs={'rows': '2' ,'placeholder': 'Places travelled to...' }))
	dreamplaces = forms.CharField(required=False, max_length=700, widget=forms.Textarea(attrs={'rows': '2' ,'placeholder': 'Dream Places to travelled to...' }))
	favtravplaces = forms.CharField(required=False, max_length=700, widget=forms.Textarea(attrs={'rows': '2' ,'placeholder': 'Favorite Travel places...' }))
	favtravseasons = forms.CharField(required=False, max_length=700, widget=forms.Textarea(attrs={'rows': '2' ,'placeholder': 'Favorite travelling season...' }))
	favtravmoto = forms.CharField(required=False, max_length=700, widget=forms.Textarea(attrs={'rows': '2' ,'placeholder': 'Favorite Travel Moto...' }))
	favtravmode = forms.CharField(required=False, max_length=700, widget=forms.Textarea(attrs={'rows': '2' ,'placeholder': 'Favorite Travel Mode...' }))
	hobbies = forms.CharField(required=False, max_length=700, widget=forms.Textarea(attrs={'rows': '2' ,'placeholder': 'Mention Hobbies...' }))
	skills = forms.CharField(required=False, max_length=700, widget=forms.Textarea(attrs={'rows': '2' ,'placeholder': 'Mention Skills...' }))
	interests = forms.CharField(required=False, max_length=700, widget=forms.Textarea(attrs={'rows': '2' ,'placeholder': 'Mention Interests...' }))
	school = forms.CharField(required=False, max_length=700, widget=forms.Textarea(attrs={'rows': '2' ,'placeholder': 'Add School...' }))
	college = forms.CharField(required=False, max_length=700, widget=forms.Textarea(attrs={'rows': '2' ,'placeholder': 'Add College...' }))
	aded = forms.CharField(required=False, max_length=700, widget=forms.Textarea(attrs={'rows': '2' ,'placeholder': 'Add Additional Educations...' }))
	currwork = forms.CharField(required=False, max_length=700, widget=forms.Textarea(attrs={'rows': '2' ,'placeholder': 'Currently working at...' }))
	prevwork = forms.CharField(required=False, max_length=700, widget=forms.Textarea(attrs={'rows': '2' ,'placeholder': 'Previously working at...' }))
	workskills = forms.CharField(required=False, max_length=700, widget=forms.Textarea(attrs={'rows': '2' ,'placeholder': 'Add Work Skills...' }))
	

	def clean_aboutme(self):
		isclean = self.cleaned_data['aboutme']
		if len(isclean) >160:
			raise forms.ValidationError('Error in About Me')
		return isclean

	def clean_days(self):
		isclean = self.cleaned_data['days']
		if (isclean in day for day in self.dayslist) :
			raise forms.ValidationError('Error in Date')
		return isclean


	def clean_months(self):
		isclean = self.cleaned_data['months']
		if (isclean in month for month in self.monthslist):
			raise forms.ValidationError('Error in Date')
		return isclean

	def clean_years(self):
		isclean = self.cleaned_data['years']
		if (isclean in year for years in self.yearslist):
			raise forms.ValidationError('Error in Date')
		return isclean

	def clean_birthplace(self):
		isclean = self.cleaned_data['birthplace']
		if len(isclean) > 500:
			raise forms.ValidationError('Error in Birth Place')
		return isclean

	def clean_livesin(self):
		isclean = self.cleaned_data['livesin']
		if len(isclean) > 500:
			raise forms.ValidationError('Error in Lives In')
		return isclean

	def clean_occupation(self):
		isclean = self.cleaned_data['occupation']
		if len(isclean) > 500:
			raise forms.ValidationError('Error in Occupation')
		return isclean

	def clean_gender(self):
		isclean = self.cleaned_data['gender']
		if (isclean in range(0,3)):
			raise forms.ValidationError('Error in Gender')
		return isclean

	def clean_relationstatus(self):
		isclean = self.cleaned_data['relationstatus']
		if (isclean in range(0,3)):
			raise forms.ValidationError('Error in Relation')
		return isclean

	def clean_email(self):
		isclean = self.cleaned_data['email']
		email_valid = re.search(r'^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$', isclean, re.I)
		if not email_valid:
			raise form.ValidationError('Error in Email')
		return isclean

	def clean_website(self):
		isclean = self.cleaned_data['website']
		if len(isclean) > 500:
			raise forms.ValidationError('Error in Website')
		return isclean

	def clean_mobile(self, *args):
		isclean = self.cleaned_data['mobile']
		valid = re.search(r'^\d{10}$', isclean)
		if not valid:
			raise forms.ValidationError('Error in Mobile')
		return isclean

	def clean_travelledplaces(self):
		isclean = self.cleaned_data['travelledplaces']
		if len(isclean) > 700:
			raise forms.ValidationError('Error in Travelled Places')
		return isclean

	def clean_dreamplaces(self):
		isclean = self.cleaned_data['dreamplaces']
		if len(isclean) > 700:
			raise forms.ValidationError('Error in Dream Places')
		return isclean

	def clean_favtravplaces(self):
		isclean = self.cleaned_data['favtravplaces']
		if len(isclean) > 700:
			raise forms.ValidationError('Error in Favorite Travel Places')
		return isclean

	def clean_favtravseasons(self):
		isclean = self.cleaned_data['favtravseasons']
		if len(isclean) > 700:
			raise forms.ValidationError('Error in Favorite Travel Season')
		return isclean

	def clean_favtravmoto(self):
		isclean = self.cleaned_data['favtravmoto']
		if len(isclean) > 700:
			raise forms.ValidationError('Error in Favorite Travel Moto')
		return isclean

	def clean_favtravmode(self):
		isclean = self.cleaned_data['favtravmode']
		if len(isclean) > 700:
			raise forms.ValidationError('Error in Favorite Travel Mode')
		return isclean

	def clean_hobbies(self):
		isclean = self.cleaned_data['hobbies']
		if len(isclean) > 700:
			raise forms.ValidationError('Error in Hobbies')
		return isclean

	def clean_skills(self):
		isclean = self.cleaned_data['skills']
		if len(isclean) > 700:
			raise forms.ValidationError('Error in Skills')
		return isclean

	def clean_interests(self):
		isclean = self.cleaned_data['interests']
		if len(isclean) > 700:
			raise forms.ValidationError('Error in Interests')
		return isclean

	def clean_school(self):
		isclean = self.cleaned_data['school']
		if len(isclean) > 700:
			raise forms.ValidationError('Error in School')
		return isclean

	def clean_college(self):
		isclean = self.cleaned_data['college']
		if len(isclean) > 700:
			raise forms.ValidationError('Error in College')
		return isclean

	def clean_aded(self):
		isclean = self.cleaned_data['aded']
		if len(isclean) > 700:
			raise forms.ValidationError('Error in Additional Educations')
		return isclean

	def clean_currwork(self):
		isclean = self.cleaned_data['currwork']
		if len(isclean) > 700:
			raise forms.ValidationError('Error in Current Work')
		return isclean

	def clean_prevwork(self):
		isclean = self.cleaned_data['prevwork']
		if len(isclean) > 700:
			raise forms.ValidationError('Error in Previous Work')
		return isclean

	def clean_workskills(self):
		isclean = self.cleaned_data['workskills']
		if len(isclean) > 700:
			raise forms.ValidationError('Error in Work Skills')
		return isclean

	def clean_facebook(self):
		isclean = self.cleaned_data['facebook']
		if len(isclean) > 700:
			raise forms.ValidationError('Error in Facebook')
		return isclean

	def clean_twitter(self):
		isclean = self.cleaned_data['twitter']
		if len(isclean) > 700:
			raise forms.ValidationError('Error in Twitter')
		return isclean

	def clean_instagram(self):
		isclean = self.cleaned_data['instagram']
		if len(isclean) > 700:
			raise forms.ValidationError('Error in Instragram')
		return isclean

	def do_update(username, aboutme, dayz, monthz, yearz, birthplace, livesin, occupation, gender, relationstatus, email, website, mobile, travelledplaces, dreamplaces, favtravplaces, favtravseasons, favtravmoto, favtravmode, hobbies, skills, interests, school, college, aded, currwork, prevwork, workskills, facebook, twitter, instagram):

		user_data_valid = RegistrationForm.check_user_exists(username)
		if user_data_valid:
			user = AuthUser.objects.get(username=username)
			doj = user.date_joined
			now = datetime.datetime.now()
			dob = dt(year=int(yearz), month=int(monthz), day=int(dayz))
			if (Pi.objects.filter(username=username).exists()):
				pi = Pi.objects.filter(username=username).update(aboutme=aboutme, dob=dob, birthplace=birthplace, livesin=livesin, occupation=occupation, gender=gender, relationstatus=relationstatus, website=website, mobile=mobile, travelledplaces=travelledplaces, dreamplaces=dreamplaces, favtravplaces=favtravplaces, favtravseasons=favtravseasons, favtravmoto=favtravmoto, favtravmode=favtravmode, hobbies=hobbies, skills=skills, interests=interests, school=school, college=college, aded=aded, currwork=currwork, prevwork=prevwork, workskills=workskills, facebook=facebook, twitter=twitter, instagram=instagram)
				return True
			else:
				pi, created = Pi.objects.update_or_create(username=username, email=email, aboutme=aboutme, doj=doj, dob=dob, birthplace=birthplace, livesin=livesin, occupation=occupation, gender=gender, website=website, mobile=mobile, pi_id=username, travelledplaces=travelledplaces, dreamplaces=dreamplaces, favtravplaces=favtravplaces, favtravseasons=favtravseasons, favtravmoto=favtravmoto, favtravmode=favtravmode, hobbies=hobbies, skills=skills, interests=interests, school=school, college=college, aded=aded, currwork=currwork, prevwork=prevwork, workskills=workskills)
				if created:
					return True
		return False

class ProfileForm(forms.Form):
	profilepic = forms.FileField(required=False)
	coverpic = forms.FileField(required=False)

	def clean_profilepic(self):
		isclean = self.cleaned_data['profilepic']
		return isclean

	def clean_coverpic(self):
		isclean = self.cleaned_data['coverpic']
		return isclean


class GetAboutInitial(forms.Form):
	def initial(username):
		data = {}
		if (AuthUser.objects.filter(username=username).exists()):
			pi = Pi.objects.filter(username=username)
			for i in pi.values():
				data = i
			return data
		return None

'''
#Using clean()
class LoginForm(forms.Form):
	username = forms.CharField(label='Username', required=True, initial='...')
	password = forms.CharField(label='Password', widget=forms.PasswordInput)
	def clean(self):
		super(LoginForm, self).clean()
		uname = self.cleaned_data.get('username')
		passw = self.cleaned_data.get('password')
		if len(uname) > 5:
			raise forms.ValidationError('Username should be < = 5')
		if not passw.isdigit():
			raise forms.ValidationError('Digits only in password')


'''

'''
#Using Validator
def valid_password(value):
	isit = re.search(r'(^\d+$)',value)
	if not isit:
		raise forms.ValidationError('Please enter only digits')#remove the form.ValidationError from views.py to get this error. Else it will throw the error from the views.py code!


class LoginForm(forms.Form):
	username = forms.CharField(label='Username', max_length=5, required=True, initial='...')
	password = forms.CharField(label='Password', widget=forms.PasswordInput, validators=[valid_password])
'''

'''
#Just implementing the normals thingy
class LoginForm(forms.Form):
	username = forms.CharField(label='Username', max_length=5, required=True, initial='...')
	password = forms.CharField(label='Password', widget=forms.PasswordInput, initial='')
	field_order = [password, username]'''
	