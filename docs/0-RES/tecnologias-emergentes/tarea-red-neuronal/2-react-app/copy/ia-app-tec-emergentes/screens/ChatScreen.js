import React, { useState, useCallback } from "react";
import { View, TouchableOpacity, Image, StyleSheet } from "react-native";
import { GiftedChat, Bubble } from "react-native-gifted-chat";
import * as ImagePicker from "expo-image-picker";
import ModelClassifier from "../services/ModelClasiffier"; // Importa tu clase

const classifier = new ModelClassifier();

export default function ChatScreen() {
  const [messages, setMessages] = useState([]);

  // Función para enviar un mensaje
  const onSend = useCallback((newMessages = []) => {
    setMessages((previousMessages) =>
      GiftedChat.append(previousMessages, newMessages)
    );
  }, []);

  // Función para seleccionar una imagen
  const pickImage = async () => {
    let result = await ImagePicker.launchImageLibraryAsync({
      mediaTypes: ImagePicker.MediaTypeOptions.Images,
      allowsEditing: true,
      aspect: [1, 1],
      quality: 1,
    });

    if (!result.canceled) {
      const imageUri = result.assets[0].uri;

      // Agregar imagen al chat
      const imageMessage = {
        _id: Math.random().toString(),
        createdAt: new Date(),
        user: { _id: 1, name: "Usuario" },
        image: imageUri,
      };
      onSend([imageMessage]);

      // Clasificar la imagen y mostrar resultado
      classifyImage(imageUri);
    }
  };

  // Función para clasificar la imagen
  const classifyImage = async (uri) => {
    try {
      const result = await classifier.classifyImage(uri);
      const responseMessage = {
        _id: Math.random().toString(),
        text: `El modelo ha clasificado la imagen como: ${result}`,
        createdAt: new Date(),
        user: { _id: 2, name: "Bot" },
      };
      onSend([responseMessage]);
    } catch (error) {
      console.error("Error al clasificar la imagen:", error);
    }
  };

  return (
    <View style={styles.container}>
      <GiftedChat
        messages={messages}
        onSend={(messages) => onSend(messages)}
        user={{ _id: 1 }}
        renderBubble={(props) => (
          <Bubble
            {...props}
            wrapperStyle={{
              right: { backgroundColor: "#007AFF" },
              left: { backgroundColor: "#E5E5EA" },
            }}
          />
        )}
      />
      <TouchableOpacity style={styles.uploadButton} onPress={pickImage}>
        <Image
          source={require("../assets/icon.png")} // Agrega un ícono de subir imagen
          style={styles.icon}
        />
      </TouchableOpacity>
    </View>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1 },
  uploadButton: {
    position: "absolute",
    bottom: 20,
    right: 20,
    backgroundColor: "#007AFF",
    padding: 10,
    borderRadius: 30,
  },
  icon: { width: 30, height: 30, tintColor: "#fff" },
});
