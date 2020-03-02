from django import forms
from django.forms import MultiWidget
from django.forms import widgets
from django.forms import ModelChoiceField

from django.core.exceptions import ValidationError 
from django.contrib.postgres import validators
from creditcards.forms import CardNumberField, CardExpiryField, SecurityCodeField


from .models import *

import datetime

# def validator_uname(value):
#     try:
#         User.objects.get(uname=value)

#         raise ValidationError('%s用戶名稱已註冊' % value)
#     except User.DoesNotExist:
#         print('此用戶名稱可使用')

# def validator_uemail(value):
#     try:
#         User.objects.get(uemail=value)
#         raise ValidationError('此信箱已註冊過')
#     except User.DoesNotExist:
#         pass

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
        # validators = [validator_uemail],
        )     

    # def clean_cpwd(self):
    #     upwd = self.cleaned_data.get('upwd')
    #     cpwd = self.cleaned_data.get('cpwd')
    #     if upwd and cpwd and upwd != cpwd:
    #         raise forms.ValidationError('密碼不相符')
    #     return cpwd

    # 通過內部類Meta表示關聯的訊息
    class Meta:
        # 指定關聯的model
        model = User

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


class LoginForm(forms.ModelForm):
    """Form definition for Login."""


    class Meta:
        """Meta definition for Loginform."""

        model = User

        fields = ('uname','upwd')

        labels = {
            'uname':'使用者名稱',
            'upwd':'密碼',
            }

        widgets = {
            'uname':forms.TextInput(attrs = {
                'id':'info_input','placeholder':'請輸入使用者名稱'
            }),
            'upwd':forms.PasswordInput(attrs={
                'id':'info_input','placeholder':'請輸入帳號密碼'
            }),
        }        


class UserCenter(forms.ModelForm):
    uintro = forms.CharField(
        label = '簡介',
        widget = forms.Textarea(
            attrs={
                'placeholder':'Describe what you love',
                'class':'uintro_textarea',
            }
        )
    )

    GENDER_CHOICES = (('男','男'),('女','女'),)


    ugender = forms.CharField(
        label = '性別',
        widget = forms.Select(
            choices=GENDER_CHOICES,
            attrs={
                'class':'ugender_input',
            }
        )
    )



    class Meta:
        model = User

        fields = ['uphoto','ugender','ucredit','ufriend','usubs']
# ,'uintro','c_num','c_date','c_year','c_authcode',
        labels = {
            'uphoto':'頭像',
            'ugender':'性別',
            'uintro':'簡介',
            'ucredit':'信用卡號',
            # 'c_num':'卡號',
            # 'c_date':'有效日期',
            # 'c_year':'有效年限',
            # 'c_authcode':'授權碼',
            'ufriend':'好友',
            'usubs':'訂閱'
        }

            # 指定小部件
        widget = {
            'uphoto':forms.FileInput(
                attrs={
                    'class':'uphoto_input',
                }
            ),
                      

            'c_num':forms.TextInput(), 
            'c_date':forms.TextInput(), 
            'c_year':forms.TextInput(), 
            'c_authcode':forms.TextInput(), 
            'ufriend':forms.TextInput(),                        
            'usubs':forms.TextInput(),  

        }


class PaymentForm(forms.Form):
                # 'c_num':'卡號',
            # 'c_date':'有效日期',
            # 'c_year':'有效年限',
            # 'c_authcode':'授權碼',
    cc_number = CardNumberField(
        attr = {
            'placeholder':'卡號',

        }
    )
    cc_expiry = CardExpiryField()
    cc_code = SecurityCodeField()