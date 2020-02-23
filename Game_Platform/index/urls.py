from django.conf.urls import url
from .views import *

urlpatterns = [
    url(r'^01-index/$',index_views),
    url(r'^02-register/$',register_views,name='reg'),
    url(r'^check_uname/$',check_uname_view),
    url(r'^03-login/$', login_views, name='login'),
    url(r'^check_login/$', check_login_view),
    url(r'^04-logout/$',logout_views),


]