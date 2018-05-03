import datetime
from datetime import datetime as dt
from django import forms
from django.core.exceptions import ObjectDoesNotExist
from django.contrib.auth.models import User
import hashlib
import re
from em.models import Login, Pi, AuthUser, Trip, Event, Feedback, Contribute


class UserInfo():

	def get_user(username):
		pi = Pi.objects.get(username=username)
		user_pic = pi.profilepic
		user_name = pi.username

		return (user_pic, user_name)
	