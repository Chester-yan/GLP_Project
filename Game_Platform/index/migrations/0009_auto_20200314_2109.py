# Generated by Django 3.0.2 on 2020-03-14 13:09

import creditcards.models
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('index', '0008_auto_20200314_2104'),
    ]

    operations = [
        migrations.AlterField(
            model_name='ucreditcard',
            name='cc_code',
            field=creditcards.models.SecurityCodeField(blank=True, max_length=4, null=True, verbose_name='授權碼'),
        ),
        migrations.AlterField(
            model_name='ucreditcard',
            name='cc_expiry',
            field=creditcards.models.CardExpiryField(blank=True, null=True, verbose_name='有效日期'),
        ),
        migrations.AlterField(
            model_name='ucreditcard',
            name='cc_number',
            field=creditcards.models.CardNumberField(blank=True, max_length=25, null=True, verbose_name='卡號'),
        ),
        migrations.AlterField(
            model_name='ucreditcard',
            name='user',
            field=models.OneToOneField(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='index.User', verbose_name='授權會員'),
        ),
        migrations.AlterField(
            model_name='user',
            name='ugender',
            field=models.CharField(blank=True, max_length=2, null=True, verbose_name='性別'),
        ),
        migrations.AlterField(
            model_name='user',
            name='uintro',
            field=models.TextField(blank=True, max_length=300, null=True, verbose_name='自我介紹'),
        ),
        migrations.AlterField(
            model_name='user',
            name='uphoto',
            field=models.ImageField(blank=True, null=True, upload_to='static/upload/', verbose_name='大頭照'),
        ),
    ]
