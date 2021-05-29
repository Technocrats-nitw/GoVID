'''
Author : Mohd Sufiyan Ansari
Team : Technocrats
About : This contains all matching urls and redirect views informations.
'''

from django.contrib import admin
from django.urls import path 
from django.views.generic.base import RedirectView
from api import views
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('admin/', admin.site.urls),
    path('',RedirectView.as_view(url = 'api')),
    path('<key>/',views.api,name='api'),
    path('api/doctor/',views.DoctorsList.as_view()),
    path('api/doctor/<key>',views.doctor),
    path('api/doctor/id/<int:pk>/',views.DoctorsDetails.as_view()),
    path('api/doctor/city/<city>/',views.DoctorsCity.as_view()),
    path('api/doctor/specs/<spc>/',views.DoctorsSpecs.as_view()),
    path('api/hospital/',views.HospitalsList.as_view()),
    path('api/hospital/<key>',views.hospital),
    path('api/hospital/id/<int:pk>/',views.HospitalsDetails.as_view()),
    path('api/hospital/city/<city>/',views.HospitalCity.as_view()),
    path('api/hospital/state/<state>/',views.HospitalState.as_view()),
    path('api/hospital/specs/<spc>/',views.HospitalSpecs.as_view()),
    path('api/img/',views.DetectImg.as_view()),
]

# Needed for Media
if settings.DEBUG:
    urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)