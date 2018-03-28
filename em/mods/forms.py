from django import forms
import re
from em.models import Login
from django.core.exceptions import ObjectDoesNotExist




#Using clean_<field_name>. This is the best choice.
class LoginForm(forms.Form):

	email = forms.EmailField(required=True, widget=forms.EmailInput(attrs={'id': 'sigin-email', 'class': 'full-width has-padding has-border aaa', 'placeholder': 'E-mail'}))
	password = forms.CharField(required=True, widget=forms.PasswordInput(attrs={'id': 'sigin-password', 'class': 'full-width has-padding has-border', 'placeholder': 'Password'}))
	#image = forms.ImageField(label='Photoo', required=False, widget=forms.ClearableFileInput())
	
	def clean_email(self, *args):
		isclean = self.cleaned_data['email']
		email_valid = re.search(r'^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$', isclean, re.I)
		if not email_valid:
			raise forms.ValidationError('Incorrect Email Address')
		return isclean

	def clean_password(self):
		isclean = self.cleaned_data['password']
		num = re.search(r'[0-9]+', isclean, re.I)
		al =  re.search(r'[a-zA-Z]+', isclean, re.I)
		if not (num and al and len(isclean)>=4):
			raise forms.ValidationError('Try a combination of Number and Digits')
		return isclean

	def loginauth(email, password):
		#print('email:' + email, 'password:' + password)
		
		try:
			if (Login.objects.get(email=email, passw=password)):
				return True
		except ObjectDoesNotExist as e:
			return False
		


	'''def clean_image(self):
		isclean = self.cleaned_data['image']
		image_valid = re.search(r'(([\w]+).+(?:jpg|jpeg|png)$)', isclean, re.I)
		if not image_valid:
			raise forms.ValidationError('Please Upload a Valid Image (jpg,jpeg or png')
	'''

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
		raise forms.ValidationError('Please enter only digits')#remove the ValidationError from views.py to get this error. Else it will throw the error from the views.py code!


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
	