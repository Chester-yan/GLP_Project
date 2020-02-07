from django.conf.urls import url
from .views import *

urlpatterns = [
    url(r'^01-index/$',index_views),
    url(r'^02-register/$',register_views,name='register'),

]