import os
import json

from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from django.http import HttpResponse, JsonResponse
from django.conf import settings
from collections import deque  # Para manejar las últimas 20 predicciones

from .services.audio_handler import enhance_and_handle_audio

class_mapping_path = os.path.join(
    os.path.dirname(__file__), "model", "class_mapping.json"
)
with open(class_mapping_path, "r") as f:
    notification_settings = json.load(f)

# Variable global para almacenar las últimas 20 predicciones
recent_predictions = deque(maxlen=20)


def dashboard(request):
    context = {
        "recent_predictions": list(recent_predictions),
        "notification_settings": notification_settings,
    }
    return render(request, "dashboard.html", context)


@csrf_exempt
def upload_audio(request):
    """
    Endpoint to receive raw audio (WAV) and save it to the server.
    """
    if request.method == "POST":
        print("Receiving audio data...")
        try:
            # Define path to save audio
            save_path = os.path.join(settings.MEDIA_ROOT, "received_audio.wav")

            # Read and save raw binary content
            with open(save_path, "wb") as f:
                f.write(request.body)

            # Obtener predicción
            prediction = enhance_and_handle_audio(save_path)

            # Guardar predicción en la cola
            recent_predictions.append(prediction)

            return JsonResponse(
                {"status": "success", "message": "Audio received and saved."},
                status=200,
            )

        except Exception as e:
            print("Error saving audio:", e)
            return JsonResponse({"status": "error", "message": str(e)}, status=500)

    else:
        return HttpResponse("Only POST method is allowed", status=405)
