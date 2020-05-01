from django.conf.urls import url, include
from .views import *
from django.conf.urls.static import static


urlpatterns = [
    url(r'^$',index_views),
    url(r'^02-register/$',register_views,name='reg'),
    url(r'^03-login/$', login_views, name='login'),
    url(r'^04-Upage/$', Upage_views, name='upage'),
    url(r'^05-Ufilm/$', Ufilm_views, name='ufilm'),
    url(r'^GameTypePage/', include('GameTypePage.urls')),

    url(r'^logout/$',logout_views),
    url(r'^check_uemail/$',check_uemail_view),
    url(r'^check_uname/$',check_uname_view),
    url(r'^check_login/$', check_login_view),
    url(r'^check_edit/$', check_edit_view),


] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
