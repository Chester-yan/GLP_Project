# Generated by Django 3.0.2 on 2020-03-18 08:52

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('index', '0008_auto_20200317_2110'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='uphoto',
            field=models.ImageField(blank=True, null=True, upload_to='media', verbose_name='大頭照'),
        ),
    ]
