import os
#from django.core.exception import ValidationError
import re

def image_check(image):
	reg_check = re.search(r'(([\w]+).+(?:jpg|jpeg|png)$)', image)
	#image_ext = os.path.splitext(image.name)[1]
	ext_list = ['.jpg', '.jpeg', '.png']
	#if image_ext not in ext_list:
	#	print(Failed)#raise ValidationError('Sorry. Image Type Not Supported')
	#print('Success')
	print(reg_check)

#image_check('____00_fileasdsad_asd.asd.asd.jpeg')
isclean = "1200aa"
i = re.search(r'[0-9]+', isclean, re.I)
ai =  re.search(r'[a-zA-Z]+', isclean, re.I)
if not (i and ai and len(isclean)>= 4):
	print('nay')
else:
	print('yay')