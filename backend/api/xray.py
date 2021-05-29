from keras import backend as K
from keras.preprocessing.image import ImageDataGenerator,load_img, img_to_array
from keras.models import Sequential, Model
from keras.layers import Conv2D, MaxPooling2D,GlobalAveragePooling2D
from keras.layers import Activation, Dropout, BatchNormalization, Flatten, Dense, AvgPool2D,MaxPool2D
from keras.models import Sequential, Model
from keras.applications.vgg16 import VGG16, preprocess_input
from keras.optimizers import Adam, SGD, RMSprop

import tensorflow as tf 

import os
import numpy as np
import pandas as pd
import cv2
from pathlib import Path

lc = Path(__file__).parent

loaded_model = tf.keras.models.load_model(os.path.join(lc,'covid19.model'))

# loaded_model.summary()

from PIL import Image
from skimage import transform
def load(filename):
   np_image = Image.open(filename)
   np_image = np.array(np_image).astype('float32')/255
   np_image = transform.resize(np_image, (224, 224, 3))
   np_image = tf.convert_to_tensor(np_image[:,:,:3])
   np_image = np.expand_dims(np_image, axis=0)
   return loaded_model.predict(np_image)


