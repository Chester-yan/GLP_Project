import json
from django.core import serializers

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


@xframe_options_sameorigin
def register_views(request):
    # 判斷get或post請求，得到用戶的請求意圖
    if request.method == 'GET':
        form = RegisterForm()
        
        return render(request,'02-register.html',locals())
    
    else:
        uname = request.POST['uname']

        #先验证手机号在数据库中是否存在
        # users = User.objects.filter(uname=uname)
        # if users:

        #     #uname 已经存在
        #     errMsg = '用戶名稱已经存在'
        #     return render(request,'02-register.html',locals())        


        form = RegisterForm(request.POST)

        if form.is_valid():
            
            # 把cpwd的值刪除，不讓帶進User()數據庫中
            form.cleaned_data.pop('cpwd')

            user = User(**form.cleaned_data)

            # 數據庫配置成功並且實體類映射成表之後，該操作可以實現
            user.save() 
            
            # 取出user中的uname和upwd的值，保存進session
            request.session['uid'] = user.id
            request.session['uname'] = user.uname
            return HttpResponse('註冊成功')

        else:
            return render(request,'02-register.html',locals())

def check_uname_view(request):
    # 接收前端傳遞過來的數據 - uname 進行重複性驗證
    uname = request.GET['uname']
    users = User.objects.filter(uname = uname)
    if users:
        status = 1
        msg = '%s 用戶名稱已註冊' % uname
    else:
        status = 0
        msg = '用戶名稱沒問題'
        
    dic = {
        'status' : status,
        'msg' : msg,
    }
    return HttpResponse(json.dumps(dic))

@xframe_options_sameorigin
def login_views(request):
    # 判斷 get 請求還是 post 請求
    if request.method == 'GET':
        # get 請求 - 判斷session,判斷cookie,登入頁
        # 判斷 session中是否有登入訊息
        if 'uid' in request.session and 'uname' in request.session:
            # 有登入訊息保存在 session
            return HttpResponse('您已經登入成功了')
            # return render(request,'01-index.html')
        else:
            # 沒有登入訊息保存在session，繼續判斷cookies中是否有登入訊息
            if 'uid' in request.COOKIES and 'uname' in request.COOKIES:
                # cookies中有登入訊息 - 曾經記住過密碼

                # 將cookies中的訊息取出來保存進session，再返回到首頁
                uid = request.COOKIES['uid']
                uname = request.COOKIES['uname']
                request.session['uid'] = uid
                request.session['uname'] = uname
                # return HttpResponse('已登入成功')

                # 已登入成功，返回首頁
                return render(request,'01-index.html')

            else:
                # cookies中沒有登入訊息 - 去往登入頁
                form = LoginForm()
                return render(request,'03-login.html',locals())

    else:
        # post請求 - 實現登入操作
        # 獲取帳號與密碼
        uid = request.POST['uid']
        uname = request.POST['uname']
        # 判斷帳號與密碼是否存在(登入是否成功)
        users = User.objects.filter(uid=uid,uname=uname)

        if users:
            # 登入成功 : 先存進session
            request.session['uid'] = users[0].id
            request.session['uname'] = uname

            # 聲明回應對象 : 回應一句話'登入成功'
            # resp = HttpResponse('登入成功')

            # 聲明回應對象 : 返回首頁
            resp = render(request,'01-index.html')
            # 判斷是否要存進cookies
            if 'isSaved' in request.POST:
                expire = 60*60*24*90
                # cookie默認不能存中文，若要存中文，要轉碼
                resp.set_cookie('uid',users[0].id,expire)
                resp.set_cookie('uname',uname,expire)
            return resp
        else:
            # 登入失敗
            form = LoginForm()
            return render(request,'03-login.html',locals())


def check_login_view(request):
    # 檢查session中是否有登入訊息，若有即獲取對應數據的uname值
    # 若session無，再查cookies
    if 'uid' in request.session and 'uphone' in request.session:
        loginStatus = 1
        #通過uid的值獲取對應的uname
        id = request.session['uid']
        uname=User.objects.get(id=id).uname
        dic = {
          'loginStatus':loginStatus,
          'uname':uname
        }
        return HttpResponse(json.dumps(dic))

    else:
        dic = {
          'loginStatus':0
        }
        return HttpResponse(json.dumps(dic))
