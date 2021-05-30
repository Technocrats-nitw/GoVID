import tensorflow as tf
import tensorflow.keras.backend as K
from tensorflow import keras
from voctor.bert import build_model_from_config
from tf_bert.loader import load_model_weights_from_checkpoint
from __future__ import absolute_import, division, print_function, unicode_literals
import os
import pandas as pd
from sklearn.model_selection import train_test_split
import numpy as np


# the feed forward network architecture 
# uses fully connected (dense) , dropout layers
class FFN(tf.keras.layers.Layer):
    def __init__(self,hidden_size=768,dropout=0.2,residual=True,name='FFN',**kwargs):
        

        super(FFN, self).__init__(name=name, **kwargs)
        self.hidden_size = hidden_size
        self.dropout = dropout
        self.residual = residual
        self.ffn_layer = tf.keras.layers.Dense(
            units=hidden_size,
            use_bias=True
        )

    def call(self, inputs):
        ffn_embedding = self.ffn_layer(inputs)
        ffn_embedding = tf.keras.layers.ReLU()(ffn_embedding)
        if self.dropout > 0:
            ffn_embedding = tf.keras.layers.Dropout(
                self.dropout)(ffn_embedding)

        if self.residual:
            ffn_embedding += inputs
        return ffn_embedding


class MedicalQAModel(tf.keras.Model):
    def __init__(self, name=''):
        super(MedicalQAModel, self).__init__(name=name)
        
        #created two different feedforward networks for q&a
        self.q_ffn = FFN(name='q_ffn', input_shape=(768,))
        self.a_ffn = FFN(name='a_ffn', input_shape=(768,))

    def call(self, inputs):
        q_bert_embed, a_bert_embed = tf.unstack(inputs, axis=1)
        q_embed, a_embed = self.q_ffn(q_bert_embed), self.a_ffn(a_bert_embed)
        return tf.stack([q_embed, a_embed], axis=1)

# linking bert with the feed forward network
class MedicalQAModelwithBert(tf.keras.Model):
    
    def __init__(self,hidden_size=768,dropout=0.2,residual=True,config_file=None,
            checkpoint_file=None,bert_trainable=True,layer_ind=-1,name=''):
        
        super(MedicalQAModelwithBert, self).__init__(name=name)
        build = checkpoint_file != None
        self.biobert, config = build_model_from_config(
            config_file=config_file,
            training=False,
            trainable=bert_trainable,
            build=build)
        if checkpoint_file is not None:
            load_model_weights_from_checkpoint(
                model=self.biobert, config=config, checkpoint_file=checkpoint_file, training=False)
        self.q_ffn_layer = FFN(
            hidden_size=hidden_size,
            dropout=dropout,
            residual=residual,
            name='q_ffn')
        self.a_ffn_layer = FFN(
            hidden_size=hidden_size,
            dropout=dropout,
            residual=residual,
            name='a_ffn')
        self.layer_ind = layer_ind

    def call(self, inputs):
        with_question = True if 'q_input_ids' in inputs else False
        with_answer = True if 'a_input_ids' in inputs else False
        
        # according to USE, the DAN network average embedding across tokens
        # passing ouput embed of feed forward network into the bert and generating new embeddings
        if with_question:
            q_bert_embedding = self.biobert(
                (inputs['q_input_ids'], inputs['q_segment_ids'], inputs['q_input_masks']))[self.layer_ind]
            q_bert_embedding = tf.reduce_mean(q_bert_embedding, axis=1)
        if with_answer:
            a_bert_embedding = self.biobert(
                (inputs['a_input_ids'], inputs['a_segment_ids'], inputs['a_input_masks']))[self.layer_ind]
            a_bert_embedding = tf.reduce_mean(a_bert_embedding, axis=1)

        if with_question:
            q_embedding = self.q_ffn_layer(q_bert_embedding)
            output = q_embedding
        if with_answer:
            a_embedding = self.a_ffn_layer(a_bert_embedding)
            output = a_embedding
        
        #stacking up the q&a embedding as shared bert while training
        if with_question and with_answer:
            output = tf.stack([q_embedding, a_embedding], axis=1)
            

        return output
