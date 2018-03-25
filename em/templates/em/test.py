from django import forms


class ValueCheck():
	'''Just Testin'''
	check_it = forms.EmailField(widget=EmailInput)
	check_it = value
	def clean_check_it(self):
		checked = self.cleaned_data['check_it']
		email_valid = re.search(r'^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$', checked, re.I)
		if not email_valid:
			raise forms.ValidationError('Incorrect Email Address')
