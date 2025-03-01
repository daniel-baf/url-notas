import * as tf from "@tensorflow/tfjs";
import "@tensorflow/tfjs-react-native";
import { bundleResourceIO } from "@tensorflow/tfjs-react-native";
import { useEffect, useState } from "react";

export function useModel() {
  const [model, setModel] = useState(null);
  const [isLoading, setIsLoading] = useState(true);

  useEffect(() => {
    async function loadModel() {
      try {
        await tf.ready();
        const modelJson = require("../assets/modelo_tfjs/model.json");
        const modelWeights = [
          require("../assets/modelo_tfjs/group1-shard1of3.bin"),
          require("../assets/modelo_tfjs/group1-shard2of3.bin"),
          require("../assets/modelo_tfjs/group1-shard3of3.bin"),
        ];

        const loadedModel = await tf.loadLayersModel(
          bundleResourceIO(modelJson, modelWeights)
        );
        setModel(loadedModel);
        console.log("Modelo cargado correctamente.");
      } catch (error) {
        console.error("Error cargando el modelo:", error);
      } finally {
        setIsLoading(false);
      }
    }

    loadModel();
  }, []);

  return { model, isLoading };
}
