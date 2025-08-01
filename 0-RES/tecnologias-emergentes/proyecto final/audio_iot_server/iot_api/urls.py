from django.urls import path
from .views.upload_view import upload_audio
from .views.dashboard import dashboard, toggle_notification

urlpatterns = [
    path("upload/", upload_audio, name="upload_audio"),
    path("dashboard/", dashboard, name="dashboard"),
    path("dashboard/toggle_notification/", toggle_notification, name="toggle_notification"),
]
