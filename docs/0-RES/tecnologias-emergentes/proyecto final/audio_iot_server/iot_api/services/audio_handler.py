from iot_api.model.audio_predict import predict_audio
from pydub import AudioSegment


def enhance_and_handle_audio(audio_path, amplification_db=5):
    # Cargar el audio
    audio = AudioSegment.from_file(audio_path)
    # Normalizar el audio (amplificación dinámica similar a Audacity)
    normalized_audio = audio.apply_gain(-audio.max_dBFS)
    # Amplificar el audio normalizado
    amplified_audio = normalized_audio.apply_gain(amplification_db)
    # Guardar el audio amplificado temporalmente
    temp_path = audio_path.replace(".wav", "_normalized_amplified.wav")
    amplified_audio.export(temp_path, format="wav")

    prediction, confidence = predict_audio(temp_path)

    print(f"\033[43mPredicted class: {prediction}, Confidence: {confidence}\033[0m")
    return prediction, confidence
