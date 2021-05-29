"""getAPI URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
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

if settings.DEBUG:
    urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)