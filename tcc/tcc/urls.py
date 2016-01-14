from django.conf.urls import include, url
from django.contrib import admin
from django.conf import settings

urlpatterns = [
    url(r'^admin/', include(admin.site.urls)),
    url(r'^$', 'core.views.index', name='index'),
    url(r'^blog/$', 'blog.views.blog', name='blog'),
    url(r'^blog/(?P<slug>[\w-]+)/$', 'blog.views.blog_detail', name='blog_detail'),
    url(r'^login/$',
        'django.contrib.auth.views.login', 
        name='login',
        kwargs={'template_name': 'login.html'}
        ),

    url(r'^login/cadastro/$',  'login.views.cadastro', name='cadastro'),

    url(
        r'^logout/$',
        'django.contrib.auth.views.logout',
        name='logout',
        kwargs={'next_page': '/login/'}
        ),

]

if settings.DEBUG:
    urlpatterns.append(
        url(
            r'^media/(?P<path>.*)$',
            'django.views.static.serve',
            {
                'document_root': settings.MEDIA_ROOT,
                'show_indexes': True
            }
        ),
    )
