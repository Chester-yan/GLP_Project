from django.conf.urls import url, include
from .views import *
from django.conf.urls.static import static


urlpatterns = [
    url(r'^ACG/$', ACG_views,),




]
