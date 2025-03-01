import * as tf from "@tensorflow/tfjs";

export class ImageClassifierService {
  private model: tf.LayersModel;

  constructor(model: tf.LayersModel) {
    this.model = model;
  }

  async classifyImage(imagePath: string): Promise<tf.Tensor> {
    const image = new Image();
    image.src = imagePath;

    return new Promise((resolve, reject) => {
      image.onload = async () => {
        try {
          const tensor = this.imageToTensor(image);
          const predictions = this.model.predict(tensor) as tf.Tensor;
          resolve(predictions);
        } catch (error) {
          reject(error);
        }
      };

      image.onerror = (error) => {
        reject(error);
      };
    });
  }

  private imageToTensor(image: HTMLImageElement): tf.Tensor {
    const tensor = tf.browser
      .fromPixels(image)
      .resizeNearestNeighbor([224, 224])
      .toFloat()
      .expandDims();
    return tensor;
  }
}
