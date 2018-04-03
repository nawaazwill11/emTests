n = 5456
hours = 0
mins = 0

while(n > 0):
	if not (n-60 < 0):
		n = n - 60
		hours += 1
	else:
		break
print(hours, n)