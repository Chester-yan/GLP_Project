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
    # 判斷 get 請求還是 post 請求
    if request.method == 'GET':
        # get 請求 - 判斷session,判斷cookie,登入頁
        # 判斷 session中是否有登入訊息
        if 'uname' in request.session and 'upwd' in request.session:
            # 有登入訊息保存在 session
            return HttpResponse('您已經登入成功了')
        else:
            # 沒有登入訊息保存在session，繼續判斷cookies中是否有登入訊息
            if 'uname' in request.COOKIES and 'upwd' in request.COOKIES:
                # cookies中有登入訊息 - 曾經記住過密碼
                # 將cookies中的訊息取出來保存進session，再返回到首頁
                uname = request.COOKIES['uname']
                upwd = request.COOKIES['upwd']
                request.session['uname'] = uname
                request.session['upwd'] = upwd
                return HttpResponse('已登入成功')
            else:
                # cookies中沒有登入訊息 - 去往登入頁
                form = LoginForm()
                return render(request,'03-login.html',locals())

    else:
        # post請求 - 實現登入操作
        # 獲取手機號與密碼
        uname = request.POST['uname']
        upwd = request.POST['upwd']
        # 判斷手機號與密碼是否存在(登入是否成功)
        users = User.objects.filter(uname=uname,upwd=upwd)
        if users:
            # 登入成功 : 先存進session
            request.session['uname'] = users[0].id
            request.session['upwd'] = upwd
            # 聲明回應對象 : 回應一句話'登入成功'
            resp = HttpResponse('登入成功')
            # 判斷是否要存進cookies
            if 'isSaved' in request.POST:
                expire = 60*60*24*90
                resp.set_cookie('uname',users[0].id,expire)
                resp.set_cookie('upwd',upwd,expire)
            return HttpResponse('登入成功',resp) 
        else:
            # 登入失敗
            form = LoginForm()
            return render(request,'03-login.html',locals())
    