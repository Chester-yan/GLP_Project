# Generated by Django 3.0.2 on 2020-03-26 07:37

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('index', '0014_auto_20200326_1412'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='filmlibrary',
            options={'ordering': ['-fdate'], 'verbose_name': '影片庫', 'verbose_name_plural': '影片庫'},
        ),
        migrations.AlterField(
            model_name='filmlibrary',
            name='ftime',
            field=models.TimeField(null=True, verbose_name='影片時間'),
        ),
    ]
