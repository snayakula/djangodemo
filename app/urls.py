from django.urls import path
from . import views

urlspatterns = [
    path('', views.hello,name='hello')
]
