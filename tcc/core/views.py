from django.shortcuts import render
from django.contrib.auth.decorators import login_required

from .models import PostTexto, PostEventos, PostImage, PostVideo
from .forms import PostTextoForm, PostEventosForm, PostImageForm, PostVideoForm

@login_required(login_url='/login')
def index(request):
    return render(request, 'index.html')


@login_required(login_url='/login')
def post_evento(request):
    if request.method == 'POST':
        form = PostEventosForm(request.POST or None)
        if form.is_valid():
            post = form.save(commit=False)
            post.usuario = request.user
            post.criado = timezone.now()
            post.save()
        else: 
            form = PostEventosForm(instance=post)
    return render(request, 'post_eventos.html', {'form':form})

@login_required(login_url='/login')
def post_texto(request):
    if request.method == 'POST':
        form = PostTextoForm(request.POST)
        if form.ise_valid():
            post = form.save(commit=False)
            post.save()
    else: 
        form = PostTextoForm()
    return render(request, 'post_texto.html', {'form':form})


@login_required(login_url='/login')
def post_imagem(request):
    pass


@login_required(login_url='/login')
def post_video(request):
    pass

