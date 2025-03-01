import React, { useState } from "react";
import { View, Text, Button, StyleSheet, Image } from "react-native";
import * as ImagePicker from "expo-image-picker";
import useModel from "../hooks/LoadModelHook";

// clasifier service
import classifyImage from "../services/ImageClassifier.service";

const Summary = () => {
  const [image, setImage] = useState(null);
  const [prediction, setPrediction] = useState(null);

  const { model, loading } = useModel(); // ✅ Extraer correctamente model y loading

  const pickImage = async () => {
    try {
      let result = await ImagePicker.launchImageLibraryAsync({
        mediaTypes: ImagePicker.MediaTypeOptions.Images,
        allowsEditing: false,
        quality: 1,
      });

      if (!result.canceled) {
        setImage(result.assets[0].uri);
        handleClassification(result.assets[0].uri);
      }
    } catch (error) {
      alert("Error al cargar la imagen. Por favor, inténtalo de nuevo.");
    }
  };

  const handleClassification = async (imagePath) => {
    // if (loading) {
    //   console.log("Modelo aún no cargado...");
    //   return;
    // }

    // if (!model) {
    //   console.error("Modelo aún no está disponible.");
    //   return;
    // }

    // const predictions = await classifyImage(imagePath, model);
    // setPrediction(predictions);
  };

  return (
    <View style={styles.container}>
      {/* Head */}
      <View style={styles.head}>
        <Text style={styles.title}>Clasificador de Objetos</Text>
      </View>

      {/* Content */}
      <View style={styles.content}>
        <View style={styles.imageContainer}>
          {image ? (
            <Image source={{ uri: image }} style={styles.image} />
          ) : (
            <Text style={styles.placeholder}>Acá se verá tu imagen</Text>
          )}
        </View>
        <Text style={styles.objectType}>
          {loading
            ? "Cargando modelo..."
            : prediction || "Aca veras las predicciones del modelo"}
        </Text>
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
