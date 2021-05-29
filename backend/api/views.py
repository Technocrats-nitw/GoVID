from django.http import HttpResponse
from django.http.response import JsonResponse
from django.shortcuts import render, get_object_or_404
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import  status
from django.core import serializers
from .models import * 
from .serializers import *
from rest_framework.decorators import api_view
import requests
import json
from collections import OrderedDict
from .responseAPI import *

# Create your views here.

def finalResult(val):
    return 'According to our CNN Model, there is a ' + str(round(100*val,3)) + '% chance \nthat you are infected with Corona-virus'

# Default Response
def api(request,key):
    if request.method == 'GET':
        API_INFO["Total Doctors Registered"] = len(Doctors.objects.all())
        API_INFO["Total Hospitals Registered"] = len(Hospital.objects.all())
        return HttpResponse(json.dumps(API_INFO, sort_keys=False, indent=4), content_type="application/json")

def doctor(request,key):
    if request.method == 'GET':
        return HttpResponse(json.dumps(API_INFO['Doctor Searches'], sort_keys=False, indent=4), content_type="application/json")

def hospital(request,key):
    if request.method == 'GET':
        return HttpResponse(json.dumps(API_INFO['Hospital Searches'], sort_keys=False, indent=4), content_type="application/json")

# Doctor API DATA
class DoctorsList(APIView):
    
    def get(self,request):
        docs = Doctors.objects.all()
        serializer = DoctorsSerializer(docs,many=True)
        ans = OrderedDict()
        ans['ItemCount'] = len(docs)
        ans['message'] = SUCCESS_MESSAGE
        ans['item'] = serializer.data
        final_response = Response(ans)
        return final_response
    
    def post(self, request, format=None):
        serializer = DoctorsSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        print(serializer.errors)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class DoctorsCity(APIView):    
    def get(self,request,city,format=None):
        doctor_get = Doctors.objects.filter(city__icontains=city)
        serializer = DoctorsSerializer(doctor_get,many=True)
        ans = OrderedDict()
        if(len(doctor_get) > 0):
            ans['ItemCount'] = len(doctor_get)
            ans['Message'] = SUCCESS_MESSAGE
            ans['item'] = serializer.data
        else:
            ans['Message'] = DOCTOR_NOT_FOUND
        final_response = Response(ans)
        return final_response 
               
class DoctorsSpecs(APIView):    
    def get(self,request,spc,format=None):
        doctor_get = Doctors.objects.filter(speciality__icontains=spc)
        serializer = DoctorsSerializer(doctor_get,many=True)
        ans = OrderedDict()
        ans['searchKey'] = spc
        if(len(doctor_get) > 0):
            ans['ItemCount'] = len(doctor_get)
            ans['Message'] = SUCCESS_MESSAGE
            ans['item'] = serializer.data
        else:
            ans['Message'] = DOCTOR_NOT_FOUND_SPC
        final_response = Response(ans)
        return final_response 
    
class DoctorsDetails(APIView):
    def delete(self, request, pk, format=None):
        print('DELETE')
        doctor_del = Doctors.objects.get(pk=pk)
        doctor_del.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)
    
    def get(self,request,pk,format=None):
        
        try:
            doctor_get = Doctors.objects.get(pk=pk)
            query = doctor_get.latitude+","+doctor_get.longitude
            print('heyy')
            purl = 'https://www.google.co.in/maps/@'+query+',13z'
            import webbrowser
            webbrowser.open(purl)
            serializer = DoctorsSerializer(doctor_get)
            return Response(serializer.data)
        except Doctors.DoesNotExist:
            return Response({'Message' : DOCTOR_NOT_FOUND})
        
            
    
    def put(self,request,pk,format=None):
        doctor_put = Doctors.objects.get(pk)
        serializer = DoctorsSerializer( doctor_put, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
# HOSPITAL DATA
class HospitalsList(APIView):
    
    def get(self,request):
        hospital_data = Hospital.objects.all()
        serializer = HospitalsSerializer(hospital_data,many=True)
        ans = OrderedDict()
        ans['ItemCount'] = len(hospital_data)
        ans['message'] = SUCCESS_MESSAGE
        ans['item'] = serializer.data
        final_response = Response(ans)
        return final_response
    
    def post(self, request, format=None):
        serializer = HospitalsSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        print(serializer.errors)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class HospitalState(APIView):    
    def get(self,request,state,format=None):
        hospital_get = Hospital.objects.filter(state__icontains=state)
        serializer = HospitalsSerializer(hospital_get,many=True)
        ans = OrderedDict()
        if(len(hospital_get) > 0):
            ans['ItemCount'] = len(hospital_get)
            ans['Message'] = SUCCESS_MESSAGE
            ans['item'] = serializer.data
        else:
            ans['Message'] = HOSPITAL_NOT_FOUND
        final_response = Response(ans)
        return final_response 
               
class HospitalCity(APIView):    
    def get(self,request,city,format=None):
        hospital_get = Hospital.objects.filter(district__icontains=city)
        serializer = HospitalsSerializer(hospital_get,many=True)
        ans = OrderedDict()
        if(len(hospital_get) > 0):
            ans['ItemCount'] = len(hospital_get)
            ans['Message'] = SUCCESS_MESSAGE
            ans['item'] = serializer.data
        else:
            ans['Message'] = HOSPITAL_NOT_FOUND
        final_response = Response(ans)
        return final_response 
    
class HospitalSpecs(APIView):    
    def get(self,request,spc,format=None):
        hospital_get = Hospital.objects.filter(specialties__icontains=spc)
        serializer = HospitalsSerializer(hospital_get,many=True)
        ans = OrderedDict()
        ans['searchKey'] = spc
        if(len(hospital_get) > 0):
            ans['ItemCount'] = len(hospital_get)
            ans['Message'] = SUCCESS_MESSAGE
            ans['item'] = serializer.data
        else:
            ans['Message'] = HOSPITAL_NOT_FOUND_SPC
        final_response = Response(ans)
        return final_response
        
class HospitalsDetails(APIView):
    def delete(self, request, pk, format=None):
        print('DELETE')
        Hospital_del = Hospital.objects.get(pk=pk)
        Hospital_del.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)
    
    def get(self,request,pk,format=None):
        try:
            hospital_get = Hospital.objects.get(pk=pk)
            serializer = HospitalsSerializer(hospital_get)
            return Response(serializer.data)
        except Hospital.DoesNotExist:
            return Response({'Message':'Hospital Not Found with this ID'})
    
    def put(self,request,pk,format=None):
        hospital_put = Hospital.objects.get(pk)
        serializer = HospitalsSerializer( hospital_put, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
        
class DetectImg(APIView):
    
    def get(self,request):
        detect = Detect.objects.all()
        serializer = DetectSerializer(detect, many=True)
        return Response(serializer.data)        
    
    def post(self,request):
        serializer = DetectSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            from .xray import load
            import os
            from django.conf import settings
            pl = serializer.data['image'].split('/')[-1]
            
            
            ARRAY = load(os.path.join(settings.MEDIA_ROOT,pl))
            return HttpResponse(finalResult(ARRAY[0][0]))
        print(serializer.errors)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)