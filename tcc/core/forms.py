# _*_ coding: utf-8 _*_

from django import forms
from django.forms import ModelForm
from .models import PostEventos, PostTexto, PostImage, PostVideo


class PostEventosForm(ModelForm): 
    class Meta:
        model = PostEventos
        fields = '__all__'
        exclude = ['username']

class PostTextoForm(ModelForm):
    class Meta:
        model = PostTexto
        fields = '__all__'
        exclude = ['username']


class PostImageForm(ModelForm):
    class Meta:
        model = PostImage
        fields = '__all__'
        exclude = ['username']



class PostVideoForm(ModelForm):
    class Meta:
        model = PostVideo
        fields = '__all__'
        exclude = ['username']

