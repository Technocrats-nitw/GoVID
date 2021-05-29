## GoVid Backend

`An App for the Mankind, of the Mankind and by the Mankind.`

### Team Technocrats
- BACKEND DEVELOPERS
	- Mohd Sufiyan Ansari
	- Chaitanya Hardikar

There was an idea to put together all the functionalities, a healthcare app would ever need. This was not seeming possible by the series of actions being undertaken until now, because we haven't thought of creating a larger network by the help of pre-existing large network i.e. **AMAZON CARE** .

Here we have used **DJANGO** Framework (Python) as preferred backend to act as API source and other several functionalities which includes filter, search and bulk database.

### Setting Up Project

- Language Requirement: Python v3.7 or Higher
- Database Used: Sqlte3

#### Install the requirements by creating a new virtual environment or in system environment.

```bash
python -m venv <env-name>
source env-name/bin/activate  (For LINUX)
OR
.\env-name\Scripts\activate   (For Windows CMD)
```

- Install requirements from requirements.txt via command
```bash
pip install requirements.txt
```

- Start the server via following command
```bash
python manage.py runserver
```
and head to http://127.0.0.1:8000 for the local server.

<hr>

### Technologies
- **rest_framework** : This library is used to create and pass API via Response to client side.
- **tensorflow & keras** : These libraries are used here to predict the chance of Covid by Chest X-ray



### File Structure:
- [settings.py](getAPI/settings.py)
	- This contains all the required settings for running the project.
- [urls.py](getAPI/urls.py)
	- This is to make matching urls that client will enter for accessing data.
- [views.py](api/views.py)
	- This contains all the views that will be called upon on urls being entered
- [models.py](api/models.py)
	- This contains all the models that serves as database entry and creation of table
- [serializers.py](api/serializers.py)
	- This is to serialize the table data and send response as API
- [responseAPI.py](api/responseAPI.py)
	- This is to pass required msgs while sending API Response via rest_framework
- [xray.py](api/xray.py)
	- This python file is responsible for predicting the chance of COVID by CNN Models using Chest X-ray

##### See this [README.md](api/README.md) for more and detailed explanation.