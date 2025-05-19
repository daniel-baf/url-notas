import os
import wave
from django.views.decorators.csrf import csrf_exempt
from django.http import JsonResponse
from django.conf import settings

# Variables globales para acumular datos
audio_buffer = bytearray()
TARGET_BYTES = 44100 * 5 * 2  # 44100 samples/s * 5 s * 2 bytes/sample = 441000 bytes


@csrf_exempt
def audio_stream(request):
    global audio_buffer

    if request.method == "POST":
        # Leer datos binarios del body
        chunk = request.body

        # Añadir al buffer global
        audio_buffer.extend(chunk)

        # Verificar si ya tenemos suficiente para 5 segundos
        if len(audio_buffer) >= TARGET_BYTES:
            # Crear carpeta para guardar archivos, si no existe
            folder_path = os.path.join(settings.BASE_DIR, "audio_files")
            os.makedirs(folder_path, exist_ok=True)

            # Nombre del archivo (puedes usar timestamp o contador)
            filename = os.path.join(folder_path, "audio_5_seconds.wav")

            # Crear archivo WAV a partir del buffer PCM
            with wave.open(filename, "wb") as wf:
                wf.setnchannels(1)  # Mono
                wf.setsampwidth(2)  # 2 bytes = 16 bits
                wf.setframerate(44100)  # 44.1 kHz
                wf.writeframes(audio_buffer[:TARGET_BYTES])

            # Eliminar los bytes usados del buffer
            audio_buffer = audio_buffer[TARGET_BYTES:]

            return JsonResponse(
                {"message": "Archivo WAV guardado", "filename": filename}
            )

        return JsonResponse(
            {
                "message": f"Recibidos {len(audio_buffer)} bytes, esperando para 5 segundos"
            }
        )

    return JsonResponse({"error": "Método no permitido"}, status=405)
