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
        form = PostEventosForm(request.POST)
        if form.is_valid():
            novo_evento = form.save()
            
        else:
            form = PostEventosForm()
    return render(request, 'post_eventos.html',
            {
                'form':form
            }
        )

@login_required(login_url='/login')
def post_texto(request):
    pass


@login_required(login_url='/login')
def post_imagem(request):
    pass


@login_required(login_url='/login')
def post_video(request):
    pass

