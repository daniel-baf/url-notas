import { useState, useEffect } from "react";
import * as tf from "@tensorflow/tfjs";

interface UseModelReturn {
  model: tf.LayersModel | null;
  loading: boolean;
  error: Error | null;
}

const useModel = (): UseModelReturn => {
  const [model, setModel] = useState<tf.LayersModel | null>(null);
  const [loading, setLoading] = useState<boolean>(true);
  const [error, setError] = useState<Error | null>(null);

  useEffect(() => {
    const loadModel = async () => {
      try {
        const model = await tf.loadLayersModel(
          "../../assets/modelo_tfjs/model.json"
        );
        setModel(model);
        setLoading(false);
      } catch (err) {
        setError(err as Error);
      } finally {
        setLoading(false);
      }
    };

    loadModel();
  }, []);

  return { model, loading, error };
};

export default useModel;
