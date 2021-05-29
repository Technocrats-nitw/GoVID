'''
Author : Mohd Sufiyan Ansari
Team : Technocrats
About : This file basically registers the models to backend/database.
'''
from django.contrib import admin

from .models import *

# Register your models here.
admin.site.register(Doctors)
admin.site.register(Hospital)
admin.site.register(Detect)