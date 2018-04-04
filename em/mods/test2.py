a = {'csrfmiddlewaretoken': ['Pk9wNHHPWhPphlFqanQO2z6nES5P6Yxa6nztT7o0vIWel3LiR3wMZ0DsXILwwrhG'], 'nop': ['no'], 'company': [''], 'moto': [''], 'source': [''], 'destination': [''], 'mode': [''], 'pitstops': ['0'], 'pitstops_time': ['0'], 'timeperpit': ['0'], 'distance': [''], 'duration': [''], 'start_date': ['2019-03-04 11'], 'gender': ['----------------'], 'age_group': ['Under 18,18-30,30-50'], 'participants': ['-1'], 'title': [''], 'description': [''], 'fuel': [''], 'vehicle': [''], 'hotel': [''], 'total': ['']}

from datetime import datetime as dt
date = a['start_date'][0]+":00"
import datetime 
b = dt.strptime(date, '%Y-%m-%d %H:%M')
print(type(b))
x = 20
y = 10
z = 200
if ((10*20) == 200):
	print('yes')
if isinstance(b, datetime.datetime):
	print('yes')
else:
	print('no')

age = a['age_group'][0].split(',')
print(age)

def func(one, two):

	return one, two

m, n = func('one', 'two')
print(m,n)

dic = {'sucess': True, 'errdate': 'Date Error'}

for key,value in dic.items():
	print

distance = '300 km'
import re
km = re.findall('\d+', distance)
print(km[0])
k = str(km[0])
print(k[-2:])