# Voctor 2.0 - Virtual Doctor
## < Hackon > with Amazon ;)

The idea of Voctor2.0 inherently comes from [Voctor 1.0](https://github.com/shivanshuman021/Voctor/tree/main/models/module3), which was our project in a previous hackathon. At that time we planned to train a T5 model to make a full fledged medical chatbot but ended up hardcoding a simple chatbot because of lack of gpu's and knowledge of training heavy models on colab. Through steady practice we explored NLP , and here in Hackon we got a chance to explore even broader aspect where we trained a BERT on medical Q/A dataset scraped from web and used GPT-2 as head of our model to generate answers to medical questions .



## Show time :

### <b>Que</b> : 
Since last week I am having headache with mild fever. I didn’t feel like eating or drinking anything and today morning I fell unconscious due to inadequate intake of fluids and food. I have dry cough. I don’t have cold. It’s been quite a few days but my fever isn’t getting cured. My improper intake of food has also caused me mild diarrhea. What should I do to cure myself from this?

<b>Voctor's reply</b> : You can avoid medical complications of the stomach flu by drinking plenty of liquids. When you can keep food down again, try bland things like toast, rice, bananas, and applesauce first. Go back to a normal diet within 24 hours if you can.


### <b>Que</b> : 
I am a type 2 diabetes patient. Since the last 2 days my blood sugar level is fluctuating which is causing me dizziness. I haven’t changed my diet pattern and have been consuming my meals along with my prescribed medicine at the right time. I am scared that because of my diabetes I might get affected by nerve damage due to excess sugar, on the other hand low blood sugar can cause me to feel giddy or in a worse case, make me unconscious. What precautions should I take?

<b>Voctor's reply</b> : Never drive a car if you have hypoglycemia or suspect it is coming on. Diabetic shock can cause you to pass out behind the wheel. If you are driving and notice symptoms, stop and check your blood sugar. If it's low, take a snack and don't start driving until the level is back in the normal range.

### <b>Que</b> :  
I am a college student and I feel I have anxiety issues. I am worried a lot about my future. I am concerned whether I will be successful or not. This stress is causing me fatigue and is also affecting my focus. I find difficulty in concentrating on a single thing at a stretch. This causes me trouble falling asleep and hence I’m not getting enough sleep. How can this issue be addressed?

<b>Voctor's reply</b> : Stress can definitely affect sex life. Try to find ways to lessen your stress at work. The fact that you've been stressed before and it hasn't affected you in this way tells me you have reached a point where the stress is too much.,If you can find a way to relieve stress at work and your sex drive returns, you will have determined this.\n\nFirst of all, look at the parts of your job that cause you the most stress. Be open with your manager and ask them for advice, too. If you can work together to find a way to lessen the load of stress you're experiencing, you're doing great. If you are feeling stressed at home too because of work, try meditation, breathing exercises, anything to get your mind off of what's going on at work. Allocate 30 minutes to talk about work, after that all work-related subjects are off the table. Put your phone away or on do-not-disturb mode in case work calls or messages you outside of hours. Prep your breakfast and lunch the day before so you don't have to worry about that the next day. Try to think of more small things that can help you prepare for work and not worry about. Take an hour to relax completely before bed. No screens, no cellphones, your girl snuggled up next to you, maybe a glass of wine, and just talk about not-work. \n\nI hope this helps!,Find a yoga studio nearby and take a few classes. It's great exercise and every class ends with great relaxation!

### <b>Que</b> : 
My grandmother has started forgetting a lot of things and I’m concerned that she might be having Alzheimer’s disease. She is acting quite confused lately and has started to lose her direction sense. How can I try to prevent the damage that is happening to her?

<b>Voctor's reply</b> : she may be developing alzheimer's disease or having a reaction to her medications or experiencing a vitamin or thyroid deficiency. her doctors can perform a variety of tests and arrive at a fairly reliable diagnosis. memory loss can be treated and it is very worthwhile to pursue the full explanation.

## Methodology 

### Data : 

Collecting data was major obstacle before training the model. So we spent our two entire days the first one in collecting and the second one in cleaning the data . 
Data Sources : 
    
    Reddit
    eHealthForums
    WebMD
    HealthTap
    iClinic


### Training :

    We used a pretrained BioBERT and used it as shared model as an Encoder, encoding input text to embedding 
    This embedding was then feeded into FCNN layers (as CNN's have tendency to extract out the similarity in different features.
    These embeddings were then feeded into pretrained GPT-2 (the generative pretrained transformer) to generate the similar Q&A 
    The loss was calculated and error was backpropagated.

<img src="https://github.com/Technocrats-nitw/Care/blob/master/res/train-arch.png" alt="Training Architecture">



### Testing :

    The same BioBERT was taken to encode the input question vector into embedding 
    This embedding was passed through the FCNN trained above to extract features and this acted as kindof similarity search of testing data with training data
    The embedding thus obtained was feeded to the GPT-2 tuned during training to generate the answer


<img src="https://github.com/Technocrats-nitw/Care/blob/master/res/test-arch.png" alt="Testing Architecture">


<a href="https://colab.research.google.com/drive/1EDLeotVVunWFMXVHE9dcsF0Vkg6gCKVv?usp=sharing" target="_top">Colab</a>



