from django.shortcuts import render
from django.http import HttpResponse
from django.template import loader

# Create your views here.

def index_views(request):
    return render(request,'01-index.html')

def register_views(request):
    return render(request,'02-register.html')

