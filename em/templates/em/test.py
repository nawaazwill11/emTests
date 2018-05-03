from django.core.exceptions import ValidationError

def clean_email(iscleanemail):
		#iscleanemail = self.cleaned_data['email']
		email_valid = re.search(r'^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$', isclean, re.I)
		if email_valid:
			email_exists = auth(iscleanemail)
			if not auth:	
				raise ValidationError('Incorrect Email Address')
			return True

	def clean_password(iscleanpw):
		
		#iscleanpw = self.cleaned_data['password']
		num = re.search(r'[0-9]+', isclean, re.I)
		al =  re.search(r'[a-zA-Z]+', isclean, re.I)
		if (num and al and len(isclean)>=4):
			pw_exists = auth(iscleanpw)
			if pw_exists:
				return True
		raise ValidationError('Invalid Password')
		

	def auth(self, email, password):
		try:
			if (Login.objects.get(email=email, password=password)):
				return True
		except ObjectDoesNotExist as err:
			return False