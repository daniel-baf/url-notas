from django.shortcuts import render, HttpResponse


def home(request):
    return HttpResponse("Hello, world. You're at the audio server home page.")
