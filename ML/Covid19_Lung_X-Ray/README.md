# CoVID-19 detection using X-ray of Lungs 

We have trained the model to predict whether a person is infected with covid-19 using tensorflow and keras. The model is based on Convolutional Neural Networks and is trained on a dataset. The trained keras model is then saved. This pre-trained model is then uploaded to the Django backend framework which is used to create a REST API. Our API accepts a POST-request of an image, predicts the probability of being infected and returns the same to the user who posted the X-ray image.


## Demonstration : 

### 1)
<img src = "https://github.com/Technocrats-nitw/Care/blob/master/ML/Covid19_Lung_X-Ray/sample/predict1.jpeg">
Output : According to our CNN Model, there is a 85.275% chance that you are infected with Coronavirus

### 2)
<img src = "https://github.com/Technocrats-nitw/Care/blob/master/ML/Covid19_Lung_X-Ray/sample/predict2.jpeg">
Output : According to our CNN Model, there is a 40.417% chance that you are infected with Coronavirus

<br />

## Methodology :

### Training : 

We have trained the model using multiple convolutional layers along with average, max pooling for down-sampling. We have then saved the keras model. [Here](https://github.com/Technocrats-nitw/Care/blob/master/ML/Covid19_Lung_X-Ray/covid_detection_x_ray.ipynb) is the link where we have trained and saved the model.

Saved Models:
1) [Keras](https://github.com/Technocrats-nitw/Care/blob/master/ML/Covid19_Lung_X-Ray/covid19.model)
2) [Tflite](https://github.com/Technocrats-nitw/Care/blob/master/ML/Covid19_Lung_X-Ray/model.tflite)

### Model Architecture :
<img src = "https://github.com/Technocrats-nitw/Care/blob/master/ML/Covid19_Lung_X-Ray/model_architecture.png">

### Testing :

For testing, refer [this](https://github.com/Technocrats-nitw/Care/blob/master/ML/Covid19_Lung_X-Ray/Untitled.ipynb) file. The similar implementaion can also be done for the keras model instead of the tflite model that we have shown.
