# Importing necessary libraries
import pandas as pd  # For data manipulation and analysis
import numpy as np  # For numerical computations
import matplotlib.pyplot as plt  # For plotting and visualization
import librosa  # For audio processing
from IPython.display import Audio  # For audio playback in Jupyter
import glob  # For file path pattern matching
from sklearn.preprocessing import LabelEncoder  # For encoding labels
import tensorflow as tf  # For deep learning models
import os  # For operating system interactions

# Configure matplotlib to display plots inline in the notebook
# %matplotlib inline


# Check GPU availability
# This code aims to verify if there are devices available for processing,
# specifically GPUs, as this model is large and the data to process (audio) is also large.
# Using a GPU can significantly accelerate the training of the model.
print("Available devices:")
print(tf.config.list_physical_devices())


# Load the data
# Define the base path where the audio files and metadata are located
FILES_PATH = "./data/UrbanSound8K"  # Path to the audio files

# Read the CSV file containing the metadata of the UrbanSound8K dataset
# This file includes information such as file name, sound class, duration, etc.
dataframe_audios = pd.read_csv(
    f"{FILES_PATH}/metadata/UrbanSound8K.csv"
)  # UrbanSound8K provides this file upon downloading the dataset

# Encode class labels into numerical format
# This step is necessary to prepare the data for machine learning models, which require numerical inputs.
label_encoder = LabelEncoder()
dataframe_audios["encoded_label"] = label_encoder.fit_transform(
    dataframe_audios["class"]
)  # Add a new column 'encoded_label' with numerical IDs for each class
number_of_classes = len(
    dataframe_audios["class"].unique()
)  # Calculate the total number of unique sound classes
number_of_classes

# Split the dataset into training and testing sets in a stratified manner
# This ensures that the distribution of classes is preserved in both sets, which is crucial for balanced training and evaluation.

from sklearn.model_selection import train_test_split

# Features: paths to audio files
audio_file_paths = dataframe_audios["audio_path"]

# Target: encoded class labels
encoded_labels = dataframe_audios["encoded_label"]

# Perform the stratified split
train_audio_paths, test_audio_paths, train_labels, test_labels = train_test_split(
    audio_file_paths,
    encoded_labels,
    test_size=0.3,
    random_state=42,
    stratify=encoded_labels,
)


def extract_mfcc(audio_file_path, num_mfcc=13, max_padding_length=174):
    """
    Extract Mel-frequency cepstral coefficients (MFCC) from an audio file.

    This function ensures that all audio features have a fixed length by applying padding or truncation.
    This is essential for preparing the data for machine learning models, which require consistent input dimensions.

    Parameters:
    - audio_file_path (str): Path to the audio file.
    - num_mfcc (int): Number of MFCC features to extract.
    - max_padding_length (int): Maximum length for padding or truncation.

    Returns:
    - numpy.ndarray: MFCC features with fixed dimensions.
    """
    audio_signal, sample_rate = librosa.load(audio_file_path, sr=None)
    mfcc_features = librosa.feature.mfcc(
        y=audio_signal, sr=sample_rate, n_mfcc=num_mfcc
    )

    # Ensure fixed length by padding or truncating
    if mfcc_features.shape[1] < max_padding_length:
        mfcc_features = np.pad(
            mfcc_features,
            ((0, 0), (0, max_padding_length - mfcc_features.shape[1])),
            mode="constant",
        )
    else:
        mfcc_features = mfcc_features[:, :max_padding_length]

    return mfcc_features


# Apply MFCC extraction to the training and testing datasets
# This step is crucial to convert raw audio data into numerical features (MFCCs)
# that can be used as input for the CNN model.

X_train_mfcc_features = np.array([extract_mfcc(path) for path in train_audio_paths])
X_test_mfcc_features = np.array([extract_mfcc(path) for path in test_audio_paths])

# Add a channel dimension to the MFCC features
# This is necessary because the CNN model expects input data with a channel dimension.
X_train_mfcc_features = X_train_mfcc_features[
    ..., np.newaxis
]  # Shape: (samples, n_mfcc, max_pad_len, 1)
X_test_mfcc_features = X_test_mfcc_features[..., np.newaxis]


from tensorflow.keras import layers, models
from tensorflow.keras import regularizers

"""
Define the CNN model for audio classification.

Why we do this:
- To classify audio samples into predefined categories using MFCC features.
- Added BatchNormalization after each convolutional layer to stabilize and accelerate training.
- Applied L2 regularization to dense layers to reduce overfitting.
"""

# Get the number of unique classes from the dataset
num_classes = number_of_classes

# Define the CNN model
audio_classification_model = models.Sequential(
    [
        # Input layer
        layers.Input(shape=(13, 174, 1)),  # Adjusted to match MFCC feature dimensions
        # Convolutional blocks
        layers.Conv2D(32, (3, 3), activation="relu"),
        layers.BatchNormalization(),
        layers.MaxPooling2D((2, 2)),
        layers.Conv2D(64, (3, 3), activation="relu"),
        layers.BatchNormalization(),
        layers.MaxPooling2D((2, 2)),
        # Flatten + Dense layers
        layers.Flatten(),
        layers.Dense(128, activation="relu", kernel_regularizer=regularizers.l2(0.01)),
        layers.Dropout(0.5),
        # Output layer
        layers.Dense(
            num_classes, activation="softmax", kernel_regularizer=regularizers.l2(0.01)
        ),  # One neuron per class
    ]
)

# Compile the model
audio_classification_model.compile(
    optimizer="adam", loss="sparse_categorical_crossentropy", metrics=["accuracy"]
)

# Display the model summary
audio_classification_model.summary()


# Train the CNN model for audio classification
# Why we do this:
# - To optimize the model's weights using the training dataset.
# - To evaluate the model's performance on the validation dataset during training.
# - To monitor the learning process and adjust hyperparameters if necessary.

history = audio_classification_model.fit(
    X_train_mfcc_features,  # Training features (MFCCs)
    train_labels,  # Training labels (encoded)
    epochs=80,  # Number of training epochs (adjustable)
    batch_size=32,  # Batch size for gradient updates
    validation_data=(X_test_mfcc_features, test_labels),  # Validation data
)


# Evaluate the model on the test dataset
# Why we do this:
# - To measure the model's performance on unseen data.
# - To calculate the test accuracy and loss for evaluation purposes.
test_loss, test_accuracy = audio_classification_model.evaluate(
    X_test_mfcc_features, test_labels
)
print(f"Test Accuracy: {test_accuracy * 100:.2f}%")

# Generate a confusion matrix to analyze model predictions
# Why we do this:
# - To visualize the performance of the model in terms of correctly and incorrectly classified samples.
# - To identify patterns of misclassification for further improvements.
from sklearn.metrics import confusion_matrix
import seaborn as sns

predicted_labels = np.argmax(
    audio_classification_model.predict(X_test_mfcc_features), axis=1
)
confusion_matrix_result = confusion_matrix(test_labels, predicted_labels)

plt.figure(figsize=(10, 8))
sns.heatmap(
    confusion_matrix_result,
    annot=True,
    fmt="d",
    xticklabels=label_encoder.classes_,
    yticklabels=label_encoder.classes_,
)
plt.xlabel("Predicted")
plt.ylabel("Actual")
plt.title("Confusion Matrix")
plt.show()

