from django.conf.urls import url
from .views import *

urlpatterns = [
    url(r'^01-index/$',index_views),
]