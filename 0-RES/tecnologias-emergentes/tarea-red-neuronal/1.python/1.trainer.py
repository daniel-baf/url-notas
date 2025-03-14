import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers
from tensorflow.keras.applications import MobileNetV2
from tensorflow.keras.applications.mobilenet_v2 import preprocess_input

dataset = "./dataset"

# Cargar y preprocesar imágenes correctamente
data_generator = keras.preprocessing.image.ImageDataGenerator(
    preprocessing_function=preprocess_input, validation_split=0.2
)

train_data = data_generator.flow_from_directory(
    dataset,
    target_size=(224, 224),
    batch_size=32,
    class_mode="categorical",
    subset="training",
)

validation_data = data_generator.flow_from_directory(
    dataset,
    target_size=(224, 224),
    batch_size=32,
    class_mode="categorical",
    subset="validation",
)

# Modelo base MobileNetV2
base_model = MobileNetV2(input_shape=(224, 224, 3), include_top=False, weights="imagenet")

base_model.trainable = False  # Congelar capas

# Modelo personalizado
model = keras.Sequential([
    base_model,
    layers.GlobalAveragePooling2D(),
    layers.Dense(128, activation="relu"),  # Añadir una capa intermedia para mejorar la representación
    layers.Dropout(0.3),  # Evitar sobreajuste
    layers.Dense(len(train_data.class_indices), activation="softmax"),  # Número de clases dinámico
])

# Compilar modelo
model.compile(
    optimizer=keras.optimizers.Adam(learning_rate=0.0001),  # Reducir LR para estabilidad
    loss=keras.losses.CategoricalCrossentropy(),
    metrics=[keras.metrics.CategoricalAccuracy()],
)

# Entrenar modelo
model.fit(train_data, epochs=10, validation_data=validation_data)

# Guardar modelo
model.save("modelo-clase-tec-emergentes.h5")
