# GoVID Backend

This **api** app deals with the main functionality of our Backend for the Project.

### Tables Created
- Doctors: Contains Database of Doctors
- Hospital: Contains Database of Hospital
- Detect: Stores Chest X-ray image for COVID Prediction

## Main Functionality
There are several views which are called depending upon the url entered.

- The first default JSON Response is how to use the website containing data of site.
```js
{
    "Message": "Follow given links for API",
    "Doctors": "https://technocrats.pythonanywhere.com/api/doctor",
    "Total Doctors Registered" : "<Dynamic Data>",
    "Total Hospitals Registered" : "<Dynamic Data>",
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
```

## GET Request

- If the valid url is used, then corresponding view is called and data is serialized into JSON format and sent back in form of API.

```python
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
```

- [serializers.py](serializers.py) is responsible for serializing all database.
```python
from rest_framework import serializers
from .models import *
class DoctorsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Doctors
        fields = '__all__'
```
The above piece of code serializes the Doctors Object.
And the response is thus sent back to client via `Response()` in correspinding views with proper messages like *SUCCESS_MESSAGE*  defined in [responseAPI.py](responseAPI.py).

## POST Request

- Data can be sent to the server too via POST request created by client (Here Flutter).
- Data is first serialised and saved into database after validating.

```python
class DoctorsList(APIView):    
    def post(self, request, format=None):
        serializer = DoctorsSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        print(serializer.errors)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
```
The above code segment is responsible for handling POST Requests.

## Search & Filter
- Main functionality of our  is the search function that provides user to search Doctor/Hospital city wise or state wise.
- Doctors and Hospitals can also be searched on the basis of their specialities.
- Also it suggests the Doctors nearby in Flutter using APIs.

url:
<pre>
Location Based: 
    /api/doctor/city/{searchKey}
    /api/hospital/city/{searchKey}
    /api/hospital/state/{searchkey}

Specification Based:
    /api/doctor/specs/{searchKey}
    /api/hospital/specs/{searchKey}
</pre>

**Additions**: Database is filtered not just on the basis of whole word but also part of words accepted.
For example: *path* can be searchKey for *Pathology* and *bad* can be search key for *Allahabad* and *Hyderabad* both.

```python
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
```
###### The above class based view will be called upon the request by client.
###### Here is the demonsration how **Flutter** will react with our **Django** Backend.

```dart
class API_doctor {
  Future<DoctorModel> getDoctors(String cityName) async {
    var client = http.Client();
    var doctorModel = null;

    var response = await client.get(Uri.parse(
        'http://technocrats.pythonanywhere.com/api/doctor/city/$cityName'));
    try {
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        doctorModel = DoctorModel.fromJson(jsonMap);
      }
    } catch (Exception) {
      return doctorModel;
    }

    return doctorModel;
  }
}
```
The above code sends get request for the doctor list filtered by city.
And gets API in reponse.

``On searchKey = 'bad'``

```js
{
    "ItemCount": 18,
    "Message": "API Generated Successfully",
    "item": [
        {
            "id": 256,
            "type": "Dentist",
            "uprn_no": 1002,
            "name": "Dr. S.P.Shukla",
            "email": "addsufiyan@gmail.com",
            "contact": "7068502705",
            "url": "https://www.practo.com/Allahabad/Doctor/dr-s-p-shukla-dentist-1?specialization=Dentist",
            "image": "https://imagesx.practo.com/providers/42803c31-f22e-4c20-87a9-436d0aa14101.jpg?i_type=t_100x100",
            "locality": "Allahabad Kty.",
            "city": "Allahabad (Prayagraj)",
            "latitude": "25.465977",
            "longitude": "81.84904",
            "priceRange": 500,
            "experience": 3,
            "isUser": false,
            "speciality": "Dentist"
        },...
    ]
}
```