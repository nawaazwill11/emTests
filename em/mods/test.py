from django import forms
from django.core.exceptions import ValidationError

class SharingForm(forms.Form):
    
    video = forms.FileField()
    photo = forms.FileField(widget=forms.ClearableFileInput(attrs={'multiple': True}))

    def clean_video(self):
    	isclean = self.cleaned_date['video']
    	if isclean is None:
    		raise forms.ValidationError('Video Error')

    def clean_photo(self):
    	isclean = self.cleaned_date['photo']
    	if isclean is None:
    		raise forms.ValidationError('Photo Error')


