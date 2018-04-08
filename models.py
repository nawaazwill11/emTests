/home/willo_buntu/emTests/media
# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from __future__ import unicode_literals

from django.db import models


class Album(models.Model):
    album_id = models.CharField(primary_key=True, max_length=26)
    user = models.ForeignKey('Login', models.DO_NOTHING)
    create_time = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'album'


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=80)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.BooleanField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=30)
    email = models.CharField(max_length=254)
    is_staff = models.BooleanField()
    is_active = models.BooleanField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class Contribute(models.Model):
    contribute_id = models.CharField(primary_key=True, max_length=26)
    location_name = models.CharField(max_length=100)
    location_type = models.CharField(max_length=100)
    season = models.CharField(max_length=100, blank=True, null=True)
    attractions = models.CharField(max_length=1000, blank=True, null=True)
    photo = models.CharField(max_length=100, blank=True, null=True)
    video = models.CharField(max_length=100, blank=True, null=True)
    username = models.CharField(max_length=200)

    class Meta:
        managed = False
        db_table = 'contribute'


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.SmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class Emergency(models.Model):
    emergency_id = models.CharField(max_length=26)
    emergency_requestor = models.CharField(max_length=26)
    emergency_respondor = models.CharField(max_length=26)
    emergency_status = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'emergency'


class Event(models.Model):
    event_id = models.CharField(primary_key=True, max_length=32)
    event_privacy = models.CharField(max_length=20)
    title = models.CharField(max_length=50, blank=True, null=True)
    description = models.CharField(max_length=160, blank=True, null=True)
    start_date = models.DateTimeField(blank=True, null=True)
    end_date = models.DateTimeField(blank=True, null=True)
    deadline = models.DateTimeField(blank=True, null=True)
    location = models.CharField(max_length=10, blank=True, null=True)
    venue_name = models.CharField(max_length=100, blank=True, null=True)
    street_address = models.CharField(max_length=100, blank=True, null=True)
    city = models.CharField(max_length=100, blank=True, null=True)
    state = models.CharField(max_length=100, blank=True, null=True)
    country = models.CharField(max_length=100, blank=True, null=True)
    pincode = models.CharField(max_length=100, blank=True, null=True)
    logo = models.CharField(max_length=100, blank=True, null=True)
    cover = models.CharField(max_length=100, blank=True, null=True)
    category = models.CharField(max_length=50, blank=True, null=True)
    activity = models.CharField(max_length=50, blank=True, null=True)
    gender = models.CharField(max_length=8, blank=True, null=True)
    age = models.CharField(max_length=20, blank=True, null=True)
    participants = models.CharField(max_length=32, blank=True, null=True)
    fees = models.FloatField(blank=True, null=True)
    created_on = models.DateTimeField()
    username = models.CharField(max_length=50)
    vacancy = models.IntegerField(blank=True, null=True)
    ownership = models.CharField(max_length=15)

    class Meta:
        managed = False
        db_table = 'event'


class EventBasics(models.Model):
    event = models.ForeignKey(Event, models.DO_NOTHING, primary_key=True)
    user = models.ForeignKey('Login', models.DO_NOTHING)
    title = models.CharField(max_length=50)
    description = models.CharField(max_length=160)
    start_date = models.DateTimeField()
    end_date = models.DateTimeField()
    deadline = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'event_basics'


class EventLocation(models.Model):
    event = models.ForeignKey(Event, models.DO_NOTHING, primary_key=True)
    user = models.ForeignKey('Login', models.DO_NOTHING)
    location = models.IntegerField()
    venue_name = models.CharField(max_length=100, blank=True, null=True)
    street_address = models.CharField(max_length=100, blank=True, null=True)
    city = models.CharField(max_length=30, blank=True, null=True)
    state = models.CharField(max_length=30, blank=True, null=True)
    country = models.CharField(max_length=30, blank=True, null=True)
    pincode = models.CharField(max_length=10, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'event_location'


class EventMisc(models.Model):
    event = models.ForeignKey(Event, models.DO_NOTHING, primary_key=True)
    user = models.ForeignKey('Login', models.DO_NOTHING)
    segment = models.CharField(max_length=30)
    category = models.CharField(max_length=30)
    activity = models.CharField(max_length=30)
    gender = models.IntegerField(blank=True, null=True)
    age = models.CharField(max_length=30, blank=True, null=True)
    participants = models.IntegerField(blank=True, null=True)
    fees = models.FloatField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'event_misc'


class EventPhoto(models.Model):
    event = models.ForeignKey(Event, models.DO_NOTHING, primary_key=True)
    user = models.ForeignKey('Login', models.DO_NOTHING)
    logo = models.BinaryField(blank=True, null=True)
    cover = models.BinaryField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'event_photo'


class EventRequest(models.Model):
    event = models.ForeignKey(Event, models.DO_NOTHING, primary_key=True)
    user = models.ForeignKey('Login', models.DO_NOTHING)
    requesting_user = models.CharField(max_length=26)
    request_status = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'event_request'


class Feedback(models.Model):
    feedback_id = models.CharField(primary_key=True, max_length=32)
    liked_using = models.CharField(max_length=30)
    assist = models.CharField(max_length=30)
    recommend = models.CharField(max_length=30)
    improvement = models.CharField(max_length=30)
    use_again = models.CharField(max_length=30)
    overall = models.CharField(max_length=30)
    description = models.CharField(max_length=160, blank=True, null=True)
    liked_most = models.CharField(max_length=30, blank=True, null=True)
    username = models.CharField(max_length=200)

    class Meta:
        managed = False
        db_table = 'feedback'


class Friends(models.Model):
    user_one = models.CharField(max_length=26)
    user_two = models.CharField(max_length=26)
    status = models.IntegerField()
    actions = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'friends'


class Login(models.Model):
    user_id = models.CharField(primary_key=True, max_length=26)
    username = models.CharField(max_length=100)
    email = models.CharField(unique=True, max_length=150)
    passw = models.CharField(max_length=30)
    first_name = models.CharField(max_length=50, blank=True, null=True)
    last_name = models.CharField(max_length=50, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'login'


class Misc(models.Model):
    user = models.ForeignKey(Login, models.DO_NOTHING, blank=True, null=True)
    flog = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'misc'


class Notification(models.Model):
    notification_id = models.CharField(primary_key=True, max_length=26)
    sender = models.CharField(max_length=26)
    receiver = models.CharField(max_length=26)
    url = models.CharField(max_length=100)
    time = models.DateTimeField()
    type = models.IntegerField()
    status = models.IntegerField()
    read = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'notification'


class Participants(models.Model):
    phenomenon = models.CharField(max_length=30, blank=True, null=True)
    part_id = models.CharField(max_length=32, blank=True, null=True)
    username = models.CharField(max_length=200, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'participants'


class Photo(models.Model):
    photo_id = models.CharField(primary_key=True, max_length=26)
    album = models.ForeignKey(Album, models.DO_NOTHING)
    user = models.ForeignKey(Login, models.DO_NOTHING)
    photo = models.BinaryField()
    url = models.CharField(max_length=100)
    likes = models.CharField(max_length=26, blank=True, null=True)
    comment = models.CharField(max_length=26, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'photo'


class Pi(models.Model):
    username = models.CharField(unique=True, max_length=100)
    email = models.CharField(max_length=150)
    aboutme = models.CharField(max_length=160, blank=True, null=True)
    doj = models.DateTimeField()
    dob = models.DateTimeField()
    birthplace = models.CharField(max_length=100, blank=True, null=True)
    profilepic = models.CharField(max_length=200, blank=True, null=True)
    coverpic = models.CharField(max_length=200, blank=True, null=True)
    livesin = models.CharField(max_length=100, blank=True, null=True)
    occupation = models.CharField(max_length=100, blank=True, null=True)
    website = models.CharField(max_length=200, blank=True, null=True)
    mobile = models.CharField(max_length=20, blank=True, null=True)
    facebook = models.CharField(max_length=100, blank=True, null=True)
    twitter = models.CharField(max_length=100, blank=True, null=True)
    instagram = models.CharField(max_length=100, blank=True, null=True)
    travelledplaces = models.CharField(max_length=1000, blank=True, null=True)
    dreamplaces = models.CharField(max_length=1000, blank=True, null=True)
    favtravplaces = models.CharField(max_length=1000, blank=True, null=True)
    favtravseasons = models.CharField(max_length=1000, blank=True, null=True)
    favtravmoto = models.CharField(max_length=1000, blank=True, null=True)
    favtravmode = models.CharField(max_length=1000, blank=True, null=True)
    school = models.CharField(max_length=1000, blank=True, null=True)
    college = models.CharField(max_length=1000, blank=True, null=True)
    aded = models.CharField(max_length=1000, blank=True, null=True)
    currwork = models.CharField(max_length=1000, blank=True, null=True)
    prevwork = models.CharField(max_length=1000, blank=True, null=True)
    workskills = models.CharField(max_length=1000, blank=True, null=True)
    hobbies = models.CharField(max_length=1000, blank=True, null=True)
    skills = models.CharField(max_length=1000, blank=True, null=True)
    interests = models.CharField(max_length=1000, blank=True, null=True)
    pi_id = models.CharField(primary_key=True, max_length=100)
    relationstatus = models.CharField(max_length=20, blank=True, null=True)
    gender = models.CharField(max_length=7, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'pi'


class PollsChoice(models.Model):
    choice_text = models.CharField(max_length=200)
    votes = models.IntegerField()
    question = models.ForeignKey('PollsQuestion', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'polls_choice'


class PollsQuestion(models.Model):
    question_text = models.CharField(max_length=200)
    pub_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'polls_question'


class PrivacySetting(models.Model):
    user = models.ForeignKey(Login, models.DO_NOTHING, primary_key=True)
    timeline = models.IntegerField()
    friends_list = models.IntegerField()
    album = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'privacy_setting'


class Simply(models.Model):
    id = models.IntegerField(primary_key=True)
    votes = models.CharField(max_length=100, blank=True, null=True)
    username = models.ForeignKey('Stupid', models.DO_NOTHING, db_column='username', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'simply'


class Story(models.Model):
    story_id = models.CharField(primary_key=True, max_length=26)
    album = models.CharField(max_length=26, blank=True, null=True)
    comments = models.CharField(max_length=26, blank=True, null=True)
    likes = models.CharField(max_length=26, blank=True, null=True)
    time = models.DateTimeField()
    description = models.CharField(max_length=160, blank=True, null=True)
    share = models.CharField(max_length=50)
    type = models.IntegerField()
    username = models.ForeignKey(AuthUser, models.DO_NOTHING, db_column='username', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'story'


class Stupid(models.Model):
    username = models.CharField(unique=True, max_length=150, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'stupid'


class Trip(models.Model):
    company = models.CharField(max_length=5, blank=True, null=True)
    moto = models.CharField(max_length=20, blank=True, null=True)
    fuel = models.FloatField(blank=True, null=True)
    vehicle = models.FloatField(blank=True, null=True)
    hotel = models.FloatField(blank=True, null=True)
    total = models.FloatField(blank=True, null=True)
    start_date = models.DateTimeField(blank=True, null=True)
    gender = models.CharField(max_length=10, blank=True, null=True)
    age_group = models.CharField(max_length=20, blank=True, null=True)
    participants = models.IntegerField(blank=True, null=True)
    title = models.CharField(max_length=50, blank=True, null=True)
    description = models.CharField(max_length=160, blank=True, null=True)
    trip_group = models.CharField(max_length=32)
    username = models.CharField(max_length=50)
    pitstops = models.IntegerField(blank=True, null=True)
    pitstops_time = models.IntegerField(blank=True, null=True)
    source = models.CharField(max_length=100, blank=True, null=True)
    destination = models.CharField(max_length=100, blank=True, null=True)
    timeperpit = models.IntegerField(blank=True, null=True)
    distance = models.CharField(max_length=50, blank=True, null=True)
    duration = models.CharField(max_length=50, blank=True, null=True)
    is_published = models.IntegerField(blank=True, null=True)
    trip_privacy = models.CharField(max_length=32, blank=True, null=True)
    trip_link = models.CharField(max_length=32, blank=True, null=True)
    trip_id = models.CharField(primary_key=True, max_length=32)
    created_on = models.DateTimeField()
    mode = models.CharField(max_length=10, blank=True, null=True)
    ownership = models.CharField(max_length=15)

    class Meta:
        managed = False
        db_table = 'trip'


class TripBasic(models.Model):
    trip_id = models.CharField(primary_key=True, max_length=30)
    user = models.ForeignKey(Login, models.DO_NOTHING)
    company = models.IntegerField()
    moto = models.IntegerField()
    occasion = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'trip_basic'


class TripCost(models.Model):
    trip_id = models.CharField(primary_key=True, max_length=30)
    user = models.ForeignKey(Login, models.DO_NOTHING)
    fuel = models.FloatField(blank=True, null=True)
    vehicle = models.FloatField(blank=True, null=True)
    hotel = models.FloatField(blank=True, null=True)
    total = models.FloatField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'trip_cost'


class TripDate(models.Model):
    trip_id = models.CharField(primary_key=True, max_length=30)
    user = models.ForeignKey(Login, models.DO_NOTHING)
    start_date = models.DateTimeField()
    end_date = models.DateTimeField()
    gender = models.IntegerField(blank=True, null=True)
    age = models.CharField(max_length=20, blank=True, null=True)
    participants = models.IntegerField(blank=True, null=True)
    title = models.CharField(max_length=50, blank=True, null=True)
    description = models.CharField(max_length=160, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'trip_date'


class TripRequest(models.Model):
    trip_id = models.CharField(primary_key=True, max_length=30)
    trip_admin = models.ForeignKey(Login, models.DO_NOTHING, db_column='trip_admin')
    requesting_user = models.CharField(max_length=26)
    request_status = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'trip_request'


class TripRoute(models.Model):
    trip_id = models.CharField(primary_key=True, max_length=30)
    user = models.ForeignKey(Login, models.DO_NOTHING)
    source = models.CharField(max_length=100)
    destination = models.CharField(max_length=100)
    mode = models.IntegerField()
    pitstops = models.IntegerField()
    pitstop_duration = models.DateTimeField()
    pitstop_distance = models.FloatField()
    total_time = models.DateTimeField()
    total_distance = models.FloatField()

    class Meta:
        managed = False
        db_table = 'trip_route'


class Video(models.Model):
    video_id = models.CharField(primary_key=True, max_length=26)
    album = models.ForeignKey(Album, models.DO_NOTHING)
    user = models.ForeignKey(Login, models.DO_NOTHING)
    video = models.BinaryField()
    url = models.CharField(max_length=100)
    likes = models.CharField(max_length=26, blank=True, null=True)
    comment = models.CharField(max_length=26, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'video'
