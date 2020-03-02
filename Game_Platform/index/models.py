from django.db import models
from creditcards.models import *


# Create your models here.

class User(models.Model):
    uname = models.CharField (max_length=30, verbose_name='使用者名稱')
    upwd = models.CharField (max_length=20, verbose_name='密碼')
    ubd = models.DateField ( verbose_name='生日')
    uemail = models.EmailField(null=False, verbose_name='信箱')

    # 以下註冊後使用者自行輸入
    ugender = models.CharField(max_length=2,  null = True, verbose_name='性別')
    uphoto = models.ImageField(upload_to = 'static/upload',null = True, blank = True, verbose_name='大頭照')
    uintro = models.TextField(max_length=300,blank = True,  verbose_name='自我介紹')
    

    # 以下後台連動管理
    ucredit = models.CharField(max_length=16, null = True, blank = True,  verbose_name='信用卡號')
    ufriend = models.CharField(max_length=30, null = True, blank = True,  verbose_name='朋友群')
    usubs = models.CharField(max_length=30, null = True, blank = True,  verbose_name='訂閱對象')
    isActive = models.BooleanField(default=True, blank = True,  verbose_name='激活用戶')
    
    # 後臺個人群組顯示名稱
    def __str__(self):
        return self.uname

    # 後台顯示樣式
    class Meta:
        # 1.修改mysql表名
        db_table = 'user'
        # 2.修改後臺群組顯示名稱
        verbose_name = '會員'
        # 3.修改名稱複數同單數
        verbose_name_plural = verbose_name
        # 4.排序方式
        ordering = ['uname']


class Creditcard(models.Model):
    c_num = models.CharField(max_length=16, verbose_name='卡號', null = True, blank = True,)
    c_date = models.CharField(max_length=2, verbose_name='有效日期', null = True, blank = True,)
    c_year = models.CharField(max_length=2, verbose_name='有效年限', null = True, blank = True,)
    c_authcode = models.CharField(max_length=3, verbose_name='授權碼', null = True, blank = True,)
    user = models.OneToOneField('User',null=True,on_delete=models.CASCADE, verbose_name='授權會員')

    def __str__(self):
        return self.c_num

    class Meta:
        db_table = 'Creditcard'
        verbose_name = '信用卡'
        verbose_name_plural = verbose_name    
    

class FilmLibrary(models.Model):
    fname = models.CharField(max_length=50, verbose_name='影片名稱')
    ftype = models.CharField(max_length=10, verbose_name='影片類型')
    fintro = models.TextField(max_length=300, blank = True,  verbose_name='影片簡介')
    fquality = models.CharField(max_length=10, verbose_name='影片畫質')

    # 以下後台連動紀錄
    fauthor = models.CharField(max_length=30, verbose_name='影片作者')
    fdate = models.DateTimeField( verbose_name='上傳日期')
    ftime = models.TimeField( verbose_name='影片時間')
    user = models.ForeignKey('User',null=True,on_delete=models.CASCADE, verbose_name='作者帳號')

    # 以下使用者網頁輸入
    flike = models.IntegerField( verbose_name='按讚數')
    fcommet = models.TextField(max_length=300, verbose_name='影片留言')

    def __str__(self):
        return self.fname

    class Meta:
        db_table = 'FilmLibrary'
        verbose_name = '影片庫'
        verbose_name_plural = verbose_name  
        ordering = ['fdate']