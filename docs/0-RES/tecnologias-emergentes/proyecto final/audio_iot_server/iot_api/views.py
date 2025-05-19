import os
import uuid
from django.shortcuts import render
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.conf import settings
from django.core.files.storage import default_storage

from .model.audio_predict import predict_audio


def about(request):
    return render(request, "iot_api/about.html")  # Include app prefix


@csrf_exempt
def upload_audio(request):
    print("Received request to upload audio file.")
    print(f"Request method: {request.method}")

    if request.method == "POST" and request.FILES.get("file"):
        audio_file = request.FILES["file"]

        # Guarda temporalmente el archivo en MEDIA_ROOT/tmp/
        tmp_dir = os.path.join(settings.MEDIA_ROOT, "tmp")
        os.makedirs(tmp_dir, exist_ok=True)

        temp_filename = f"{uuid.uuid4().hex}.wav"
        temp_path = os.path.join(tmp_dir, temp_filename)

        with default_storage.open(temp_path, "wb+") as destination:
            for chunk in audio_file.chunks():
                destination.write(chunk)

        try:
            predicted_class, confidence = predict_audio(temp_path)
            response = {
                "predicted_class": predicted_class,
                "confidence": round(confidence, 4),
            }
            print(f"Predicted class: {predicted_class}, Confidence: {confidence}")
            return JsonResponse(response, status=200)
        except Exception as e:
            return JsonResponse({"error": f"Prediction failed: {str(e)}"}, status=500)
        finally:
            # Limpieza del archivo temporal
            if os.path.exists(temp_path):
                os.remove(temp_path)
    else:
        return JsonResponse(
            {"error": "Invalid request method or no file provided."}, status=400
        )
