import re
age_group = ('18-50').isDigit()
if not(re.match(r'\D', age_group)):
	print('yes')