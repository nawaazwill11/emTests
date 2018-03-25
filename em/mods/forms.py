from django import forms
import re


#Using clean_<field_name>. This is the best choice.
class LoginForm(forms.Form):

	username = forms.CharField(label='Username', required=True, initial='...',widget=forms.TextInput(attrs={'id': 'usernameasdasda', 'class': 'pol'}))
	password = forms.CharField(label='Password', widget=forms.PasswordInput)
	email = forms.EmailField(label='Email', label_suffix=' >', widget=forms.EmailInput)
	#image = forms.ImageField(label='Photoo', required=False, widget=forms.ClearableFileInput())
	field_keyOrder = ['password', 'email', 'username']
	def clean_username(self):
		isclean = self.cleaned_data['username']
		if len(isclean) > 5:
			raise forms.ValidationError('Reduce username length to 5 or less', code='invalid')
		return isclean

	def clean_password(self):
		isclean = self.cleaned_data['password']
		if not isclean.isdigit():
			raise forms.ValidationError('Numeric Values only')

	def clean_email(self):
		isclean = self.cleaned_data['email']
		email_valid = re.search(r'^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$', isclean, re.I)
		if not email_valid:
			raise forms.ValidationError('Incorrect Email Address')

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
	