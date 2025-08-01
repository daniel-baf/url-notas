import os
import numpy as np
from .mfcc_extractor import extract_mfcc
import json
from tensorflow.keras.models import load_model

# Load class_mapping from class_mapping.json in the same directory as this script
class_mapping = {}
model = None

# Obtiene el directorio donde está este archivo
BASE_DIR = os.path.dirname(os.path.abspath(__file__))

# Construye la ruta absoluta al archivo JSON
json_path = os.path.join(BASE_DIR, "class_mapping.json")

with open(json_path, "r") as f:
    class_mapping = json.load(f)


# Load the model
model_path = os.path.join(BASE_DIR, "audio_classification_model.keras")
model = load_model(model_path)


def predict_audio(audio_path):
    """
    Predicts the class of an audio file using your trained model and original extract_mfcc.

    Args:
        audio_path (str): Path to the audio file (e.g., "test.wav")
        model (keras.Model): Trained CNN model

    Returns:
        tuple: (predicted_class, confidence)
    """

    # 1. Extract MFCCs using YOUR original function
    mfcc_features = extract_mfcc(audio_path)  # Shape: (39, 174)

    # 2. Transpose and reshape TO MATCH TRAINING
    mfcc_features = mfcc_features.T  # Shape: (174, 39)
    mfcc_features = mfcc_features[np.newaxis, ..., np.newaxis]  # Shape: (1, 174, 39, 1)

    # 3. Predict
    predictions = model.predict(mfcc_features, verbose=0)[0]
    predicted_class_idx = np.argmax(predictions)
    confidence = float(predictions[predicted_class_idx])

    # 4. Map to class name
    id_to_class = {v["id"]: k for k, v in class_mapping.items()}

    return id_to_class[predicted_class_idx], confidence
