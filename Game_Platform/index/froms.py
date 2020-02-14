from django import forms

from .models import *

import datetime


class RegisterForm(forms.ModelForm):
    # 通過內部類Meta表示關聯的訊息
    class Meta:
        # 指定關聯的model
        model = User

        # 指定要顯示的控件
        fields = ['uname','upwd','ubd','uemail']

        # 指定控件對應的label
        labels = {
            'uname':'使用者名稱',
            'upwd':'密碼',
            'cpwd':'確認密碼',
            'ubd':'生日',
            'uemail':'信箱'
        }

        # 指定每個控件對應的小部件，並給出其他屬性
        nowyear = datetime.datetime.now().year
        widgets = { 
            'uname':forms.TextInput(attrs= {
                'class':'info_input',
                'placeholder':'設定使用者名稱'
            }),

            'upwd':forms.PasswordInput(attrs={
                'class':'info_input',
                'placeholder':'設定密碼',
            }),

            'cpwd':forms.PasswordInput(attrs={
                'class':'info_input',
                'placeholder':'請再輸入一次密碼',
            }),

            'ubd':forms.SelectDateWidget(years=range(1900,nowyear), 
            attrs={
                'class':'info_input',
            }),

            'uemail':forms.EmailInput(attrs={
                'class':'info_input',
                'placeholder':'請輸入信箱',
            }),                        

        }