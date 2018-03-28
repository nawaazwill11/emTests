str = 'http://127.0.0.1:8000/em/?next=/em/album/#0'

f = str.find('=/em/') + 5
u = str.find('#', f)-1
print(str[f:u])



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
			l = LoginForm.loginauth(user)
			if user is not None:				
				a = auth_login(request, user)
				next_url = request.GET.get('next')
				if next_url:
					if '=' in next_url:
						f = str.find('=/em/') + 5
						u = str.find('#', f)-1
						redirect_url = next_url[f:u]
					else: 
						redirect_url = 'timeline.html'
						return JsonResponse({'success':True, 'url': redirect_url})
			else:
				raise ValidationError('nope')
		return render(request, self.template_name, context=None)



