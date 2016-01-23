from django.shortcuts import render
from django.contrib.auth.decorators import login_required

from .models import PostTexto,  PostTextoForm,  PostEventos,PostEventosForm, PostImage, PostImageForm, PostVideo,  PostVideoForm

@login_required(login_url='/login')
def index(request):
    if request.method == 'POST':
        form_evento = PostEventosForm(request.POST or None)
        form_texto = PostTextoForm(request.POST or None )
        form_imagem = PostImageForm(request.POST or None)
        form_video = PostVideoForm(request.POST or None)

        if form_evento.is_valid():
            post = form_evento.save(commit=false)
            post.usuario = request.user.username
            post.criado = timezone.now()
            post.save()
        else: 
            form_evento = PostEventosForm()

       
    return render(request, 'index.html',
            {
                'form_evento':form_evento,
                'form_texto':form_texto,
                'form_imagem':form_imagem,
                'form_video':form_video,

            }
        )



