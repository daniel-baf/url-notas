import React, { useState } from "react";
import { View, Text, Button, StyleSheet, Image } from "react-native";
import * as ImagePicker from "expo-image-picker";
import useModel from "../hooks/useModelHook";
import { ImageClassifierService } from "../services/ImageClassifier.service";
import TeachableMachineWebView from "./WebView";

// Definir tipos para los estados
interface ImageResult {
  uri: string;
}

const Summary: React.FC = () => {
  const [image, setImage] = useState<string | null>(null); // El estado puede ser una URI o null
  const [prediction, setPrediction] = useState<string | null>(null); // El estado de predicción puede ser un string o null
  const { model, loading, error } = useModel();

  const pickImage = async () => {
    try {
      let result = await ImagePicker.launchImageLibraryAsync({
        mediaTypes: "images",
        allowsEditing: false,
        quality: 1,
      });

      if (!result.canceled) {
        const selectedImage = result.assets[0] as ImageResult; // Aseguramos que sea de tipo ImageResult
        setImage(selectedImage.uri);
        handleClassification(selectedImage.uri);
      }
    } catch (error) {
      alert("Error al cargar la imagen. Por favor, inténtalo de nuevo.");
    }
  };

  const handleClassification = async (imagePath: string) => {
    // Aquí iría la lógica de clasificación de la imagen
    try {
      // Simulación de predicción
      if (!model) {
        alert("Modelo no cargado.");
        return;
      }

      const prediction = await new ImageClassifierService(model).classifyImage(
        imagePath
      );
      setPrediction("Objeto clasificado"); // Cambia esto con la lógica real
      console.log(prediction);
    } catch (error) {
      alert("Error en la clasificación de la imagen.");
    }
  };

  return (
    <View style={styles.container}>
      {/* Head */}
      <View style={styles.head}>
        <Text style={styles.title}>Clasificador de Objetos</Text>
      </View>

      {/* Content */}
      <View style={styles.content}>
        {/* <View style={styles.imageContainer}>
          {image ? (
            <Image source={{ uri: image }} style={styles.image} />
          ) : (
            <Text style={styles.placeholder}>Acá se verá tu imagen</Text>
          )}
        </View>
        <Text style={styles.objectType}>
          {loading
            ? "Cargando modelo..."
            : prediction
            ? prediction
            : "Acá se verán las predicciones"}
        </Text> */}
        <TeachableMachineWebView />
      </View>

      {/* Footer */}
      <View style={styles.footer}>
        <Button title="Cargar Imagen" onPress={pickImage} disabled={loading} />
      </View>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: "space-between",
    padding: 20,
  },
  head: {
    alignItems: "center",
    marginBottom: 20,
  },
  title: {
    fontSize: 24,
    fontWeight: "bold",
  },
  content: {
    flex: 1,
    alignItems: "center",
    justifyContent: "center",
  },
  imageContainer: {
    width: 200,
    height: 200,
    backgroundColor: "#f0f0f0",
    justifyContent: "center",
    alignItems: "center",
    shadowColor: "#000",
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.3,
    shadowRadius: 4,
    elevation: 5,
    marginBottom: 20,
  },
  image: {
    width: "100%",
    height: "100%",
    resizeMode: "cover",
  },
  placeholder: {
    color: "gray",
  },
  objectType: {
    fontSize: 16,
    color: "black",
  },
  footer: {
    alignItems: "center",
    marginTop: 20,
  },
});

export default Summary;
