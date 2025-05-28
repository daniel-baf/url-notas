import os

from django.views.decorators.csrf import csrf_exempt
from django.http import HttpResponse, JsonResponse
from django.conf import settings

from ..services.audio_handler import enhance_and_handle_audio
import datetime
from .dashboard import recent_predictions  # Ajusta el import según corresponda


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
            prediction, confidence = enhance_and_handle_audio(save_path)

            # Guardar predicción en la cola
            recent_predictions.append(
                {
                    "prediction": prediction,
                    "confidence": f"{confidence * 100:.4f}",
                    "time": datetime.datetime.now()  # Esto guarda un objeto datetime real
                }
            )

            return JsonResponse(
                {
                    "status": "success",
                    "prediction": prediction,
                    "confidence": f"{confidence * 100:.4f}%",
                },
                status=200,
            )

        except Exception as e:
            print("Error saving audio:", e)
            return JsonResponse({"status": "error", "message": str(e)}, status=500)

    else:
        return HttpResponse("Only POST method is allowed", status=405)
