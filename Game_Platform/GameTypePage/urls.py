from django.conf.urls import url, include
from .views import *
from django.conf.urls.static import static


urlpatterns = [
    url(r'^ACG/$', ACG_views,),
    url(r'^AVG/$', AVG_views,),
    url(r'^STG/$', STG_views,),
    url(r'^RTS/$', RTS_views,),
    url(r'^RPG/$', RPG_views,),
    url(r'^RCG/$', RCG_views,),
    url(r'^SPG/$', SPG_views,),
    url(r'^SLG/$', SLG_views,),
    url(r'^PZG/$', PZG_views,),
    url(r'^FTG/$', FTG_views,),

]
