from django.contrib import admin
from .models import *

# 高級管理類
class UserAdmin(admin.ModelAdmin):
    list_display = ('uname', 'uemail', 'ubd')
    search_fields = ('uname', 'uemail')
    list_filter = ('uname', 'uemail', )
    date_hierarchy = ('ubd')

    fieldsets = (
        ('基本資料', {
            "fields": ('uname', 'upwd', 'uemail', 'ubd'),
        }),

        ('詳細資料', {
            "fields": ('uphoto', 'ugender', 'ufriend', 'usubs', 'uintro'),
        }),

        ('管制資料', {
            "fields": ('ucredit', 'isActive'),
            "classes" : ('collapse',),
        })
    )
    

class UcreditcardAdmin(admin.ModelAdmin):
    pass

class FilmAdmin(admin.ModelAdmin):
    date_hierarchy = 'fdate'
    # pass


# Register your models here.
admin.site.register(User,UserAdmin)
admin.site.register(Ucreditcard,UcreditcardAdmin)
admin.site.register(FilmLibrary,FilmAdmin)