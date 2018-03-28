class TestPageView(TemplateView):
	template_name = 'test/test1.html'
	form = SharingForm
	#@login_required
	def get(self, request, *args, **kwargs):
		form = self.form(initial='')
		return render(request, self.template_name, {'form': form})

	def post(self, request, **kwargs):
		form = self.form(request.POST, request.FILES)
		if form.is_valid():
			for field in request.FILES.keys():
                		for formfile in request.FILES.getlist(field):
                			save_uploaded_file_to_media_root(formfile)                    
			return HttpResponseRedirect('/about/contact/thankyou')
		
		return render(request, 'test/test1.html', {'form': form})