from django.shortcuts import render, redirect, reverse
from django.http import HttpResponse, HttpResponseRedirect
from django.template import loader

from django.conf import settings
from django.utils.deprecation import MiddlewareMixin
from django.views.decorators.clickjacking import xframe_options_sameorigin
from django.contrib.auth import authenticate,login,logout



from .models import *
from .froms import * 


# Create your views here.

def index_views(request):
    return render(request,'01-index.html')


# @xframe_options_sameorigin
def register_views(request):

    # 判斷get或post請求，得到用戶的請求意圖
    if request.method == 'GET':
        form = RegisterForm()
        
        return render(request,'02-register.html',locals())
    
    else:
        form = RegisterForm(request.POST)

        if form.is_valid():
            
            # 把cpwd的值刪除，不讓帶進User()數據庫中
            form.cleaned_data.pop('cpwd')

            user = User(**form.cleaned_data)

            # 數據庫配置成功並且實體類映射成表之後，該操作可以實現
            user.save() 
            
            return HttpResponse('註冊成功')

        else:
            return render(request,'02-register.html',locals())

        










def login_views(request):
    return render(request, '03-login.html')

    