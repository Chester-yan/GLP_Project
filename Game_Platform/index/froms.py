from django import forms
from django.forms import MultiWidget
from django.core.exceptions import ValidationError 
from django.contrib.postgres import validators

from .models import *

import datetime

def validator_uname(value):
    try:
        User.objects.get(uname=value)

        raise ValidationError('%s用戶名稱已註冊' % value)
    except User.DoesNotExist:
        print('此用戶名稱可使用')

def validator_uemail(value):
    try:
        User.objects.get(uemail=value)
        raise ValidationError('此信箱已註冊過')
    except User.DoesNotExist:
        pass

class RegisterForm(forms.ModelForm):
    nowyear = datetime.datetime.now().year

    uname = forms.CharField(label='使用者名稱',
        required = True,
        min_length = 4,
        max_length = 30,
        error_messages = {
            'required':'這裡必須填寫',
            'min_length':'用戶名至少5字數',
            'max_length':'用戶名最多30字數'
            },
        validators = [validator_uname],
        
        widget = forms.TextInput(
            attrs = {'id':'info_input','placeholder':'設定使用者名稱'}
        ))

    upwd = forms.CharField(
        label = '密碼',
        widget = forms.PasswordInput(
        attrs = {'id':'info_input','placeholder':'設定密碼'}
        ),
        )


    cpwd = forms.CharField(
        label = '確認密碼',
        widget = forms.PasswordInput(
        attrs = {'id':'info_input','placeholder':'請再輸入一次密碼'}
        ),
        )

    ubd = forms.DateField(
        label='生日',
        widget=forms.SelectDateWidget(years=range(nowyear, 1930, -1),
        )
        )

    uemail = forms.CharField(
        label = '信箱',
        widget = forms.EmailInput(
        attrs = {'id':'info_input','placeholder':'請輸入信箱'}
        ),
        validators = [validator_uemail],
        )     

    def clean_cpwd(self):
        upwd = self.cleaned_data.get('upwd')
        cpwd = self.cleaned_data.get('cpwd')
        if upwd and cpwd and upwd != cpwd:
            raise forms.ValidationError('密碼不相符')
        return cpwd

    # 通過內部類Meta表示關聯的訊息
    class Meta:
        # 指定關聯的model
        model = User

        # # 遮蔽不顯示的控件
        # exclude = [
        #     'GENDER_CHOICES',
        #     'ugender',
        #     'uphoto',
        #     'uintro',
        #     'ucredit',
        #     'ufriend',
        #     'usubs',
        #     'isActive'
        # ]

        # 指定要顯示的控件
        fields = ['uname','upwd','cpwd','ubd','uemail']
        
        # 指定控件對應的label
        labels = {
            'uname':'使用者名稱',
            'upwd':'密碼',
            'cpwd':'確認密碼',
            'ubd':'生日',
            'uemail':'信箱'
            }

        # errMsg = {'required':'這裡必須填寫'}


        # # 指定每個控件對應的小部件，並給出其他屬性
        # widgets = { 
        #     'uname':forms.TextInput(attrs= {
        #         'id':'info_input',
        #         'placeholder':'設定使用者名稱'
        #     }),

        #     'upwd':forms.PasswordInput(attrs={
        #         'id':'info_input',
        #         'placeholder':'設定密碼',
        #     }),

        #     'uemail':forms.EmailInput(attrs={
        #         'id':'info_input',
        #         'placeholder':'請輸入信箱',
        #     }),                        

        # }

    # def clean_cpwd(self):
    #     upwd = self.cleaned_data.get('upwd')
    #     cpwd = self.cleaned_data.get('cpwd')
    #     if upwd and cpwd and upwd != cpwd:

    #         raise forms.ValidationError('密碼不相符')
    #     else:

    #         return cpwd
    
    # 定义全局的钩子，用来校验密码和确认密码字段是否相同，执行全局钩子的时候，
    # cleaned_data里面肯定是有了通过前面验证的所有数据
    


    # # 定义全局的钩子，用来校验密码和确认密码字段是否相同，执行全局钩子的时候，cleaned_data里面肯定是有了通过前面验证的所有数据
    # def clean(self):
    #     password_value = self.cleaned_data.get('password')
    #     re_password_value = self.cleaned_data.get('re_password')
    #     if password_value == re_password_value:
    #         return self.cleaned_data #全局钩子要返回所有的数据
    #     else:
    #         self.add_error('re_password', '两次密码不一致') #在re_password这个字段的错误列表中加上一个错误，并且clean_data里面会自动清除这个re_password的值，所以打印clean_data的时候会看不到它
    #         raise ValidationError('两次密码不一致')
        




