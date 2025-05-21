from django.views.decorators.csrf import csrf_exempt
from django.http import HttpResponse, JsonResponse
import os
from django.conf import settings

from .model.audio_predict import predict_audio

from .services.audio_handler import enhance_and_handle_audio


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

            enhance_and_handle_audio(save_path)

            return JsonResponse(
                {"status": "success", "message": "Audio received and saved."},
                status=200,
            )

        except Exception as e:
            print("Error saving audio:", e)
            return JsonResponse({"status": "error", "message": str(e)}, status=500)

    else:
        return HttpResponse("Only POST method is allowed", status=405)
