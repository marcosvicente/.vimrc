from django.shortcuts import render, get_object_or_404

from .models import PostBlog


def blog(request):
    blog_list = PostBlog.objects.all()
    return render(request, 'blog.html', {
            'blog_list': blog_list
        })


def blog_detail(request, slug):
    blog = get_object_or_404(PostBlog, slug=slug)
    return render(request, 'blog-detail.html', {
                        'blog': blog
                    })
