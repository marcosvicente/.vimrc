# _*_ coding: utf-8 _*_
import os

from django.db import models
from django.contrib.auth.models import User

class PostEventos(models.Model):
    usuario = models.OneToOneField(User, unique=True)
    nome = models.CharField(max_length=50)
    estado = models.CharField(max_length=50)
    cidade = models.CharField(max_length=50)
    data = models.DateField()
    hora = models.DateTimeField()
    url = models.URLField(max_length=200, null=True)

    def __str__(self):
        return self.nome


class PostTexto(models.Model):
    usuario = models.OneToOneField(User, unique=True)
    titulo = models.CharField(max_length=50, null=True)
    texto = models.TextField(null=True)
    data = models.DateField()

    
    def __str__(self):
        return self.titulo


class PostImage(models.Model):
    usuario = models.OneToOneField(User, unique=True)
    image = models.ImageField(upload_to="arquivo_de_image", blank=True, null=True)
    data = models.DateField()
    hora = models.DateTimeField()


    def arquivo_de_image(instance, username):
        return os.path.join('photos', str(instance.id), username)

class PostVideo(models.Model):
    usuario = models.OneToOneField(User, unique=True)
    video = models.FileField(upload_to="arquivo_de_video", blank=True, null=True)
    data = models.DateField()
    hora = models.DateTimeField() 

    def arquivo_de_video(instance, username):
        return os.path.join('videos', str(instance.id), username)



