# Generated by Django 3.0.2 on 2020-03-16 15:09

import creditcards.models
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='User',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('uname', models.CharField(max_length=30, verbose_name='使用者名稱')),
                ('upwd', models.CharField(max_length=20, verbose_name='密碼')),
                ('ubd', models.DateField(verbose_name='生日')),
                ('uemail', models.EmailField(max_length=254, verbose_name='信箱')),
                ('ugender', models.CharField(blank=True, max_length=2, null=True, verbose_name='性別')),
                ('uphoto', models.ImageField(blank=True, null=True, upload_to='static/upload', verbose_name='大頭照')),
                ('uintro', models.TextField(blank=True, max_length=300, null=True, verbose_name='自我介紹')),
                ('ucredit', models.CharField(blank=True, max_length=16, null=True, verbose_name='信用卡號')),
                ('ufriend', models.CharField(blank=True, max_length=30, null=True, verbose_name='朋友群')),
                ('usubs', models.CharField(blank=True, max_length=30, null=True, verbose_name='訂閱對象')),
                ('isActive', models.BooleanField(blank=True, default=True, verbose_name='激活用戶')),
            ],
            options={
                'verbose_name': '會員',
                'verbose_name_plural': '會員',
                'db_table': 'user',
                'ordering': ['uname'],
            },
        ),
        migrations.CreateModel(
            name='Ucreditcard',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('cc_number', creditcards.models.CardNumberField(blank=True, max_length=25, null=True, verbose_name='卡號')),
                ('cc_expiry', creditcards.models.CardExpiryField(blank=True, null=True, verbose_name='有效日期')),
                ('cc_code', creditcards.models.SecurityCodeField(blank=True, max_length=4, null=True, verbose_name='授權碼')),
                ('user_id', models.OneToOneField(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='index.User', verbose_name='授權會員')),
            ],
            options={
                'verbose_name': '信用卡庫',
                'verbose_name_plural': '信用卡庫',
                'db_table': 'Ucreditcard',
            },
        ),
        migrations.CreateModel(
            name='FilmLibrary',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fname', models.CharField(max_length=50, verbose_name='影片名稱')),
                ('ftype', models.CharField(max_length=10, verbose_name='影片類型')),
                ('fintro', models.TextField(blank=True, max_length=300, verbose_name='影片簡介')),
                ('fquality', models.CharField(max_length=10, verbose_name='影片畫質')),
                ('fauthor', models.CharField(max_length=30, verbose_name='影片作者')),
                ('fdate', models.DateTimeField(verbose_name='上傳日期')),
                ('ftime', models.TimeField(verbose_name='影片時間')),
                ('flike', models.IntegerField(verbose_name='按讚數')),
                ('fcommet', models.TextField(max_length=300, verbose_name='影片留言')),
                ('user', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='index.User', verbose_name='作者帳號')),
            ],
            options={
                'verbose_name': '影片庫',
                'verbose_name_plural': '影片庫',
                'db_table': 'FilmLibrary',
                'ordering': ['fdate'],
            },
        ),
    ]
