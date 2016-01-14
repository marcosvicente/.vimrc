from django.contrib import admin

from .models import PostBlog


class AdminPostBlog(admin.ModelAdmin):
    list_fields = ('titulo', 'dia', 'imagem')
    prepopulated_fields = {"slug": ("titulo",)}

admin.site.register(PostBlog, AdminPostBlog)
