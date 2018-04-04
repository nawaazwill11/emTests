list1 = ['babu', 'baby']
a = '29'
list1.append(["my name's"+a+" games"])
print(list1[2][0])

def app(sad):
	return(sad)

list1.append(app('sad'))

import datetime

time = datetime.datetime.now()
print(time)
time_dict = {'time': time}
print (str(time_dict['time'])[:10])
time_str = str(time)[:10]
print(time_str)