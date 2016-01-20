# _*_ coding: utf-8 _*_
from django import forms

from .models import PostEventos, PostTexto, PostImage, PostVideo

class PostEventosForm(forms.ModelForm):
    
    class Meta:
        model = PostEventos
        fields = (
                'usuario', 
                'nome',
                'estado',
                'cidade',
                'data',
                'hora',  
                'url',
                )

class PostTextoForm(forms.ModelForm):

    class Meta:
        model = PostTexto
        fields = ('usuario','titulo', 'texto', )


class PostImageForm(forms.ModelForm):
    class Meta:
        model = PostImage
        fields = '__all__'
        exclude = ['username']



class PostVideoForm(forms.ModelForm):
    class Meta:
        model = PostVideo
        fields = '__all__'
        exclude = ['username']

