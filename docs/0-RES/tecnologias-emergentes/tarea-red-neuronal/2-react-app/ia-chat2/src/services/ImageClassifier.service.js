// import * as tf from "@tensorflow/tfjs";
// import * as FileSystem from "expo-file-system";
// import * as ImageManipulator from "expo-image-manipulator";

/**
 * Convierte una imagen en un tensor
 */
const imageToTensor = async (uri) => {
  // try {
  //   // Convertir imagen a 224x224 para el modelo
  //   const manipulatedImage = await ImageManipulator.manipulateAsync(uri, [
  //     { resize: { width: 224, height: 224 } },
  //   ]);

  //   const imgB64 = await FileSystem.readAsStringAsync(manipulatedImage.uri, {
  //     encoding: FileSystem.EncodingType.Base64,
  //   });

  //   const imgBuffer = tf.util.encodeString(imgB64, "base64").buffer;
  //   const raw = new Uint8Array(imgBuffer);
  //   const imgTensor = tf.tensor3d(raw, [224, 224, 3]);

  //   const normalized = imgTensor.div(255.0); // Normalizar imagen
  //   return normalized.expandDims(0); // Expandir dimensiones para el modelo
  // } catch (error) {
  //   console.error("Error al convertir la imagen en tensor:", error);
  //   return null;
  // }
};

/**
 * Clasifica una imagen usando el modelo cargado
 */
const classifyImage = async (imagePath, model) => {
//   if (!model) {
//     console.error("Modelo no cargado");
//     return null;
//   }

//   const tensor = await imageToTensor(imagePath);
//   if (!tensor) return null;

//   try {
//     const predictions = model.predict(tensor);
//     const results = await predictions.data(); // ✅ Asegurar que es un await
//     return results;
//   } catch (error) {
//     console.error("Error clasificando la imagen:", error);
//     return null;
//   }
};

export default classifyImage;
