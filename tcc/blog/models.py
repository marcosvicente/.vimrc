from django.db import models


class PostBlog(models.Model):
    titulo = models.CharField(max_length=100)
    slug = models.SlugField(max_length=100, blank=True, unique=True)
    dia = models.DateField(auto_now=True)
    mudanca = models.DateTimeField(auto_now=True)
    imagem = models.ImageField(upload_to="blog")
    texto = models.TextField()

    def __str__(self):
        return self.titulo
