from django.urls import path
from . import views

urlpatterns = [
    path("upload/", views.upload_audio, name="upload_audio"),
    path("dashboard/", views.dashboard, name="dashboard"),
]
