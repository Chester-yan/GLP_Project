from django.db import models

# Create your models here.

class User(models.Model):
    uname = models.CharField(max_length=30)
    upwd = models.CharField(max_length=20)
    ubd = models.DateField()
    uemail = models.EmailField()

    # 以下註冊後使用者自行輸入
    uphoto = models.ImageField()
    uintro = models.TextField(max_length=300)

    # 以下後台連動管理
    ucredit = models.CharField(max_length=16)
    ufriend = models.CharField(max_length=30)
    usubs = models.CharField(max_length=30)
    isActive = models.BooleanField(default=True)

    def __str__(self):
        return self.uname

    class Meta:
        db_table = 'user'


class Creditcard(models.Model):
    c_num = models.CharField(max_length=16)
    c_date = models.CharField(max_length=2)
    c_year = models.CharField(max_length=2)
    c_authcode = models.CharField(max_length=3)

    def __str__(self):
        return self.c_num
    
    class Meta:
        db_table = 'creditcard'

class FilmLibrary(models.Model):
    fname = models.CharField(max_length=50)
    ftype = models.CharField(max_length=10)
    fintro = models.TextField(max_length=300)
    fquality = models.CharField(max_length=10)

    # 以下後台連動紀錄
    fauthor = models.CharField(max_length=30)
    fdate = models.DateTimeField()
    ftime = models.DateTimeField()

    # 以下使用者網頁輸入
    flike = models.IntegerField()
    fcommet = models.TextField(max_length=300)

    def __str__(self):
        return self.fname

    class Meta:
        db_table = "fname"
