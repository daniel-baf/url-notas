from django.urls import path
from . import views

urlpatterns = [
    path("", views.about, name="about"),
    path("upload/", views.upload_audio, name="upload_audio"),
]
