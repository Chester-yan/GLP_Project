from django.shortcuts import render
from django.http import HttpResponse
from django.template import loader

from django.conf import settings
from django.utils.deprecation import MiddlewareMixin
from django.views.decorators.clickjacking import xframe_options_sameorigin


# Create your views here.







def index_views(request):
    return render(request,'01-index.html')


@xframe_options_sameorigin
def register_views(request):
    return render(request,'02-register.html')

