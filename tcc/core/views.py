from django.shortcuts import render
from django.contrib.auth.decorators import login_required

from .models import PostTexto,  PostTextoForm,  PostEventos,PostEventosForm, PostImage, PostImageForm, PostVideo,  PostVideoForm

@login_required(login_url='/login')
def index(request):
    form = PostEventosForm()
    return render(request, 'index.html', {'form':form})


@login_required(login_url='/login')
def post_evento(request):
    if request.method == 'POST':
        form_evento = PostEventosForm(request.POST or None)
        if form_evento.is_valid():
            post = form_evento.save(commit=False)
            post.usuario = request.user.username
            post.criado = timezone.now()
            post.save()
        else: 
            form_evento = PostEventosForm(instance=post)
    return render(request, 'post_eventos.html', {'form_evento':form_evento})

@login_required(login_url='/login')
def post_texto(request):
    if request.method == 'POST':
        form_texto = PostTextoForm(request.POST or None)
        if form_texto.is_valid():
            post = form_texto.save(commit=False)
            post.save()
    else: 
        form_texto = PostTextoForm()
    return render(request, 'post_texto.html', {'form':form})


@login_required(login_url='/login')
def post_imagem(request):
    pass


@login_required(login_url='/login')
def post_video(request):
    pass

