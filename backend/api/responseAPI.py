'''
Author : Mohd Sufiyan Ansari
Team : Technocrats
About : This file contains constant responses for API requests.
'''

from collections import OrderedDict
from .models import *

HOSPITAL_NOT_FOUND = "There is no registerd Hospital at this location currently"

HOSPITAL_NOT_FOUND_SPC = "There are no Hospitals registerd with this specialisation"

ID_NOT_FOUND = "No such ID Exists"

SUCCESS_MESSAGE = "API Generated Successfully"

UPRN_NOT_FOUND = "There is no Doctor with this UPRN currently"

DOCTOR_NOT_FOUND = "There are no Doctors registerd from this location currently"

DOCTOR_NOT_FOUND_SPC = "There are no Doctors registerd with this specialisation"

API_INFO = {
    "Message": "Follow given links for API",
    "Doctors": "https://technocrats.pythonanywhere.com/api/doctor",
    "Total Doctors Registered" : len(Doctors.objects.all()),
    "Total Hospitals Registered" : len(Hospital.objects.all()),
    "Hospitals": "https://technocrats.pythonanywhere.com/api/hospital",
    "Doctor Searches": {
        "Search Doctor By ID" : "https://technocrats.pythonanywhere.com/api/doctor/id/{SearchID}",
        "Search Doctor By City" : "https://technocrats.pythonanywhere.com/api/doctor/city/{SearchCity}",
        "Search Doctor By specialisation" : "https://technocrats.pythonanywhere.com/api/doctor/specs/{SearchKey}"
    },
    "Hospital Searches" : {
        "Search Hospital By ID" : "https://technocrats.pythonanywhere.com/api/hospital/id/{SearchID}",
        "Search Hospital By State": "https://technocrats.pythonanywhere.com/api/hospital/state/{SearchState}",
        "Search Hospital By Specialisation" : "https://technocrats.pythonanywhere.com/api/hospital/specs/{SearchKey}"
    }
}

API_INFO = OrderedDict(API_INFO)