import json
from django.core import serializers

from django.shortcuts import render, redirect, reverse
from django.http import HttpResponse, HttpResponseRedirect
from django.template import loader

from django.conf import settings
from django.utils.deprecation import MiddlewareMixin
from django.views.decorators.clickjacking import xframe_options_sameorigin
from django.contrib.auth import authenticate,login,logout

# from django.core.files.storage import FileSystemStorage



from index.models import *
from index.froms import * 

# Create your views here.
def ACG_views(request):
    
    if request.method == 'GET':
        Ufilm = FilmLibrary.objects.filter.values_list('videofile')
        Ufilmall = FilmLibrary.objects.filter.values(
            'videofile',
            'fname',
            'fintro',
            'ftype',
            'fdate',
            'flike',
            'fcommet',
            )
    
        print('Ufilmall:',Ufilmall)
        videotup = ()

        for x in Ufilm:
            print(x)
            videotup += x
        
        print('videotup:',videotup)


        return render(request,'ACG.html',locals())
