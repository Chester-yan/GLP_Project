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
#     if request.method == 'POST':
#         form = RegisterForm(request.POST)

#         if form.is_valid():
#             form.save()
#             return HttpResponse('註冊成功')
#             # return render(request,'02-register.html',locals())

#     else:
#         form = RegisterForm()
#         # errorMsg = field.error_messages
#         # return render(request,'02-register.html',locals())

#     return render(request,'02-register.html',locals())


    # 判斷get或post請求，得到用戶的請求意圖
    if request.method == 'GET':
        form = RegisterForm()

        return render(request,'02-register.html',locals())
    
    else:
        form = RegisterForm(request.POST)

        if form.is_valid():
            user = User(**form.cleaned_data)
            # 數據庫配置成功並且實體類映射成表之後，該操作可以實現
            user.save() 
        else:

            # errorMsg = form.errors

            # for field in errorMsg:
            #     print(field)

            return render(request,'02-register.html',locals())

    return render(request,'02-register.html')

        # # 先驗證帳號與信箱是否已存在於數據庫
        # # 驗證帳號名稱
        # uname = request.POST['uname']
        # users = User.objects.filter(uname=uname)
        # if users:
        #     # 帳號已存在
        #     errMsg = '帳號名稱已存在'
        #     return render(request,'02-register.html',locals())
        # upwd = request.POST['upwd']

        # ubd = request.POST['ubd']

        # uemail = request.POST['uemail']
        # uemails = User.objects.filter(uemail=uemail)
        # if uemails:
        #     # 信箱已存在
        #     errMsg = '信箱已註冊過'
        #     return render(request,'02-register.html',locals())
        
        # # 接收數據插入到數據庫中

    
        # user = User()
        # user.uname = uname
        # user.upwd = upwd
        # user.ubd = ubd
        # user.uemail = uemail
        # user.save()
        # return HttpResponse('註冊成功')







def login_views(request):
    return render(request, '03-login.html')

    