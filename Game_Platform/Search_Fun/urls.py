from django.conf.urls import url, include
from .views import *
from django.conf.urls.static import static


urlpatterns = [
    url(r'^Search_Page/$', Search_Page_views,),

]
