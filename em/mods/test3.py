from datetime import datetime as dt

dob = "1993-11-24"
madedate = dt.strptime(dob, '%Y-%m-%d')
print(madedate)