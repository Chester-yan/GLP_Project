# Generated by Django 3.0.2 on 2020-04-02 05:04

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('index', '0017_remove_filmlibrary_slug'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='filmlibrary',
            name='fauthor',
        ),
        migrations.RemoveField(
            model_name='filmlibrary',
            name='fquality',
        ),
        migrations.AlterField(
            model_name='filmlibrary',
            name='fcommet',
            field=models.IntegerField(max_length=300, null=True, verbose_name='留言數'),
        ),
    ]
