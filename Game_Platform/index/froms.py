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
        required = False,
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
        required = False,
        label = '性別',
        widget = forms.Select(
            choices=GENDER_CHOICES,
            attrs={
                'class':'ugender_input',
            }
        )
    )

    ufriend = forms.CharField(
        # required = False,
        widget = forms.TextInput(
            attrs = {
                'placeholder':'加入好友',
            }        
        ),
    )

    usubs = forms.CharField(
        required = False,
        widget = forms.TextInput(
            attrs = {
                'placeholder':'加入訂閱',
            }        
        ),
    )

    uphoto = forms.ImageField(
        required = False,
        label = '頭像',
        widget = forms.FileInput(
            attrs = {
                'id':'uphoto_input',
            },
        ),
    )



    class Meta:
        model = User

        fields = ['uphoto','ugender','ucredit','ufriend','usubs']
        
        labels = {
            'uphoto':'頭像',
            'ugender':'性別',
            'uintro':'簡介',
            'ucredit':'信用卡號',
            'ufriend':'好友',
            'usubs':'訂閱'
        }

            # 指定小部件
        # widget = {
        #     'uphoto':forms.FileInput(
        #         attrs={
        #             'id':'uphoto_input',
        #         }
        #     )
        #     }        
                      



class PaymentForm(forms.ModelForm):
    cc_number = CardNumberField(

    )
    cc_expiry = CardExpiryField(

    )
    cc_code = SecurityCodeField(

    )

    class Meta:

        model = Ucreditcard

        fields = ['cc_number','cc_expiry','cc_code']

        labels = {
            'cc_number':'卡號',
            'cc_expiry':'有效期限',
            'cc_code':'授權碼'
        }

        widgets = {
            'cc_number':forms.TextInput(

                attrs = {
                    'placeholder':'卡號'
                }
            ),
            'cc_expiry':forms.TextInput(

            ),
            'cc_code':forms.TextInput(

                attrs = {
                    'placeholder':'授權碼'

                    }
            )                           
        }

class UfilmForm(forms.ModelForm):

    fname = forms.CharField(
    required = False,
    label = '影片名稱',
    widget = forms.TextInput(
        attrs = {
            'id':'fname_input',
        },
    ),
    )

    fintro = forms.CharField(
    required = False,
    label = '影片簡介',
    widget = forms.TextInput(
        attrs = {
            'id':'fintro_input',
        },
    ),
    )

    slug = forms.CharField(
    required = False,
    widget = forms.TextInput(
        attrs = {
            'id':'slug_input',
        },
    ),
    )

    videofile = forms.FileField(
    required = False,
    label = '上傳影片',
    widget = forms.FileInput(
        attrs = {
            'id':'videofile_input',
            'accept':'video/*'
        },
    ),
    )


    class Meta:

        model = FilmLibrary

        fields = ['fname','fintro','slug','videofile']

        # labels = {
        #     'fname':'影片名稱',
        #     'fintro':'影片簡介',
        #     'videofile':'上傳影片'
        # }
        

