import * as tf from "@tensorflow/tfjs";
import * as tfjs from "@tensorflow/tfjs-react-native";
import { useEffect, useState } from "react";

const useModel = () => {
  const [model, setModel] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const loadModel = async () => {
      try {
        //   await tf.ready(); // Asegurar que TensorFlow.js está listo
        //   // Cargar archivos desde assets
        //   const modelJson = await fetch(require("../../assets/modelo_tfjs/model.json")).then(res => res.json());
        //   const modelWeights = await fetch(require("../../assets/modelo_tfjs/weights.bin")).then(res => res.arrayBuffer());
        //   // Cargar el modelo
        //   const loadedModel = await tf.loadLayersModel(
        //     bundleResourceIO(modelJson, modelWeights)
        //   );
        //   setModel(loadedModel);
      } catch (error) {
        console.error("Error cargando el modelo:", error);
      } finally {
        setLoading(false);
      }
    };
    loadModel();
  }, []);

  return { model, loading }; // ✅ Devuelve model y loading
};

export default useModel;
