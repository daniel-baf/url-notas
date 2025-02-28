# entrenar el modelo usando tensorflow

import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers

dataset = "./dataset"

# Cargar y pre procesar las imagenes
data_generator = keras.preprocessing.image.ImageDataGenerator(
    rescale=1.0 / 255, validation_split=0.2
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

# Modelo usado MobileNeto como base
base_model = keras.applications.MobileNetV2(
    input_shape=(224, 224, 3), include_top=False, weights="imagenet"
)

base_model.trainable = False  # congelar las capas

model = keras.Sequential(
    [
        base_model,
        layers.GlobalAveragePooling2D(),
        layers.Dense(2, activation="relu"),
        layers.Dense(len(train_data.class_indices), activation="softmax"),
    ]
)


# Compilar el modelo
model.compile(
    optimizer=keras.optimizers.Adam(),
    loss=keras.losses.CategoricalCrossentropy(),
    metrics=[keras.metrics.CategoricalAccuracy()],
)
model.fit(train_data, epochs=10, validation_data=validation_data)

# Guardar el modelo
model.save("modelo-clase-tec-emergentes.h5")