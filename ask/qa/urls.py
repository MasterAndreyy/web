from django.conf.urls import url
from qa.views import test

urlpatterns = [
    url(r'^$', test, name='question_list'),
    url(r'^question/(?P<pk>\d+)/', test, name='question_detail'),
    url(r'^popular/', test, name='popular'),
    url(r'^ask/', test, name='question_ask'),
    url(r'^answer/', test, name='question_answer'),
    url(r'^signup/', test, name='signup'),
    url(r'^login/', test, name='login'),
    url(r'^logout/', test, name='logout'),
    url(r'^new/', test, name='new'),
]