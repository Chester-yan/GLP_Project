# Generated by Django 3.0.2 on 2020-03-20 08:01

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('index', '0012_auto_20200320_1546'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='uphoto',
            field=models.ImageField(blank=True, null=True, upload_to='upload/', verbose_name='大頭照'),
        ),
    ]
