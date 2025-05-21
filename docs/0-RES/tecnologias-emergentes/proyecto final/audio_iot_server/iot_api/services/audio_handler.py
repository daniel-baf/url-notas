from iot_api.model.audio_predict import predict_audio


def enhance_and_handle_audio(audio_path):
    # TODO: enchance audio
    prediction, confidence = predict_audio(audio_path)

    print(f"\033[43mPredicted class: {prediction}, Confidence: {confidence}\033[0m")
