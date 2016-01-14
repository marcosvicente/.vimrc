# _*_ coding: utf-8 _*_

from django.db import models



class PostEventos(models.Model):
    nome = models.CharField(max_length=50)
    estado = models.CharField(max_length=50)
    cidade = models.CharField(max_length=50)
    data = models.DateField()
    hora = models.DateTimeField()
    url = models.URLField(max_length=200, null=True)

    def __str__(self):
        return self.nome


class PostTexto(models.Model):
    titulo = models.CharField(max_length=50, null=True)
    texto = models.TextField(null=True)
    data = models.DateField()


def __str__(self):
    return self.titulo



