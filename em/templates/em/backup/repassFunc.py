
'''
	def re_password(self, passw):
		isclean = self.cleaned_data['repassword']
		num = re.search(r'[0-9]+', isclean, re.I)
		al =  re.search(r'[a-zA-Z]+', isclean, re.I)
		if not (num and al and len(isclean)>=4):
			raise forms.ValidationError('Try a combination of Number and Digits')
		if not isclean == passw:
			raise forms.ValidationError('Passwords don\'t match')
		return isclean
'''