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
def Search_Page_views(request):
    
    if request.method == 'GET':
        Ufilmall = FilmLibrary.objects.filter(ftype='動作').values(
            'videofile',
            'fname',
            'fintro',
            'fdate',
            'flike',
            'fcommet',
            )
    
        print('Ufilmall:',Ufilmall)


        return render(request,'07-Search_Fun.html',locals())