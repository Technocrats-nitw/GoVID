## GoVID Backend

`This **api** app deals with the main functionality of our Backend for the Project.`

#### Tables Created
- Doctors: Contains Database of Doctors
- Hospital: Contains Database of Hospital
- Detect: Stores Chest X-ray image for COVID Prediction

### Main Functionality
There are several views which are called depending upon the url entered.

- The first default JSON Response is how to use the website containing data of site.
```json
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

### GET Request

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

### POST Request

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

### Search & Filter