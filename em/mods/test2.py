import datetime
import time
from datetime import datetime as dt
date = datetime.date.today()

time = time.strftime('%H:%M:%S', time.gmtime(12345))
doj = dob = (str(date)+' '+str(time))
print(dob,doj)
datetime_object = dt.strptime('2018-02-31', '%Y-%M-%S')
time_obj = dt.strptime('13:49:15', '%H:%M:%S')
#datetime.datetime.combine(datetime.date(date),datetime.time(time))
day = 31
month = '03'
year = 2018
date = dt(year=year, month=3, day=day)
print (date)