import * as tf from "@tensorflow/tfjs";
import "@tensorflow/tfjs-react-native";
import * as ImageManipulator from "expo-image-manipulator";
import * as FileSystem from "expo-file-system";
import { useModel } from "../hooks/ModelLoader"; // Importa tu hook de modelo

class ModelClassifier {
  constructor() {
    this.model = null;
    this.isLoading = true;
    this.setup();
  }

  async setup() {
    try {
      const { model, isLoading } = useModel();
      this.model = model;
      this.isLoading = isLoading;
    } catch (error) {
      console.error("Error cargando el modelo:", error);
    }
  }

  async classifyImage(uri) {
    if (this.isLoading || !this.model) {
      throw new Error("El modelo aún no está cargado.");
    }

    try {
      const imageTensor = await this.preprocessImage(uri);
      if (!imageTensor) throw new Error("Error procesando la imagen.");

      const predictions = this.model.predict(imageTensor);
      const output = predictions.arraySync();
      return output[0]; // Retorna la primera predicción
    } catch (error) {
      console.error("Error clasificando la imagen:", error);
      return null;
    }
  }

  async preprocessImage(uri) {
    try {
      const manipResult = await ImageManipulator.manipulateAsync(
        uri,
        [{ resize: { width: 224, height: 224 } }],
        { format: ImageManipulator.SaveFormat.JPEG }
      );

      const imgB64 = await FileSystem.readAsStringAsync(manipResult.uri, {
        encoding: FileSystem.EncodingType.Base64,
      });

      const raw = tf.util.encodeString(imgB64, "base64").buffer;
      let imageTensor = tf.tensor(new Uint8Array(raw), [224, 224, 3]);
      imageTensor = imageTensor.div(tf.scalar(255));

      return imageTensor.expandDims(0);
    } catch (error) {
      console.error("Error procesando la imagen:", error);
      return null;
    }
  }
}

export default ModelClassifier;
