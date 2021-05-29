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
