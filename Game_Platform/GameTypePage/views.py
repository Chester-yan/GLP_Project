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
        Ufilmall = FilmLibrary.objects.filter(ftype='動作').values(
            'videofile',
            'fname',
            'fintro',
            'fdate',
            'flike',
            'fcommet',
            )
    
        print('Ufilmall:',Ufilmall)


        return render(request,'06-GameTypePage.html',locals())

def AVG_views(request):
    
    if request.method == 'GET':
        Ufilmall = FilmLibrary.objects.filter(ftype='冒險').values(
            'videofile',
            'fname',
            'fintro',
            'fdate',
            'flike',
            'fcommet',
            )
    
        print('Ufilmall:',Ufilmall)


        return render(request,'06-GameTypePage.html',locals())


def STG_views(request):
    
    if request.method == 'GET':
        Ufilmall = FilmLibrary.objects.filter(ftype='射擊').values(
            'videofile',
            'fname',
            'fintro',
            'fdate',
            'flike',
            'fcommet',
            )
    
        print('Ufilmall:',Ufilmall)


        return render(request,'06-GameTypePage.html',locals())


def RTS_views(request):
    
    if request.method == 'GET':
        Ufilmall = FilmLibrary.objects.filter(ftype='戰略').values(
            'videofile',
            'fname',
            'fintro',
            'fdate',
            'flike',
            'fcommet',
            )
    
        print('Ufilmall:',Ufilmall)


        return render(request,'06-GameTypePage.html',locals())


def RPG_views(request):
    
    if request.method == 'GET':
        Ufilmall = FilmLibrary.objects.filter(ftype='角色扮演').values(
            'videofile',
            'fname',
            'fintro',
            'fdate',
            'flike',
            'fcommet',
            )
    
        print('Ufilmall:',Ufilmall)


        return render(request,'06-GameTypePage.html',locals())


def RCG_views(request):
    
    if request.method == 'GET':
        Ufilmall = FilmLibrary.objects.filter(ftype='競速').values(
            'videofile',
            'fname',
            'fintro',
            'fdate',
            'flike',
            'fcommet',
            )
    
        print('Ufilmall:',Ufilmall)


        return render(request,'06-GameTypePage.html',locals())


def SPG_views(request):
    
    if request.method == 'GET':
        Ufilmall = FilmLibrary.objects.filter(ftype='運動').values(
            'videofile',
            'fname',
            'fintro',
            'fdate',
            'flike',
            'fcommet',
            )
    
        print('Ufilmall:',Ufilmall)


        return render(request,'06-GameTypePage.html',locals())


def SLG_views(request):
    
    if request.method == 'GET':
        Ufilmall = FilmLibrary.objects.filter(ftype='模擬').values(
            'videofile',
            'fname',
            'fintro',
            'fdate',
            'flike',
            'fcommet',
            )
    
        print('Ufilmall:',Ufilmall)


        return render(request,'06-GameTypePage.html',locals())


def PZG_views(request):
    
    if request.method == 'GET':
        Ufilmall = FilmLibrary.objects.filter(ftype='益智').values(
            'videofile',
            'fname',
            'fintro',
            'fdate',
            'flike',
            'fcommet',
            )
    
        print('Ufilmall:',Ufilmall)


        return render(request,'06-GameTypePage.html',locals())


def FTG_views(request):
    
    if request.method == 'GET':
        Ufilmall = FilmLibrary.objects.filter(ftype='格鬥').values(
            'videofile',
            'fname',
            'fintro',
            'fdate',
            'flike',
            'fcommet',
            )
    
        print('Ufilmall:',Ufilmall)


        return render(request,'06-GameTypePage.html',locals())