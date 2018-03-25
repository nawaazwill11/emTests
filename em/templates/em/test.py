import re

def reg(string):
	isit = re.search(r'(^\d+$)', string)
	if not isit:
		print('nay')
	else:
		print('yay')

reg('121as')