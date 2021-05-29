from django.db import models

# Create your models here.
class Doctors(models.Model):
    type = models.CharField(max_length=60)
    uprn_no = models.IntegerField(default=0,unique=True)
    name = models.CharField(max_length=60)
    email = models.EmailField(max_length=255)
    contact = models.CharField(max_length=15)
    url = models.URLField()
    image = models.CharField(max_length=600)
    locality = models.CharField(max_length=200)
    city = models.CharField(max_length=20,default='City')
    latitude = models.CharField(max_length=20)
    longitude = models.CharField(max_length=20)
    priceRange = models.IntegerField()
    experience = models.IntegerField()
    isUser = models.BooleanField(default=False)
    speciality = models.CharField(max_length=60)
    
    
    def __str__(self):
        return self.name
    
class Hospital(models.Model):
    name = models.CharField(max_length=100,default='-')
    location = models.CharField(max_length=100,default='-')
    coordinates = models.CharField(max_length=35,default='-')
    state = models.CharField(max_length=30,default='-')
    district = models.CharField(max_length=40,default='-')
    pincode = models.CharField(max_length=7,default='-')
    telephone = models.CharField(max_length=20,default='-')
    ambulance_count = models.IntegerField(default=0)
    plasma_donor_count = models.IntegerField(default=0)
    email = models.EmailField(default='abcd@example.com')
    website = models.CharField(max_length=150,default='-')
    specialties = models.CharField(max_length=1400,default='-')
    stateID = models.IntegerField(default=0)
    districtID = models.IntegerField(default=0)
    oxygenCount = models.IntegerField(default=0)
    remedesivirCount = models.IntegerField(default=0)
    isVaccineCenter = models.BooleanField(default=False)
    avaialbleBedsCount = models.IntegerField(default=0)
    
    def __str__(self):
        return self.name
    
class Detect(models.Model):
    userID = models.IntegerField(default=0,blank=True)
    image = models.ImageField(upload_to='')
    
    def __str__(self):
        return str(self.userID)