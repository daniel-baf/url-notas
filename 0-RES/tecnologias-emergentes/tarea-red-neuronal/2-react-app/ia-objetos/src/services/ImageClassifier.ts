import config from "../../assets/config.json"; // Importa directamente el JSON

async function handleClassification(imagePath: string) {
  try {
    const API_URL = `${config.BACKEND_API_URL}/clasificar`;
    let formData = new FormData();

    // Convertir la imagen en Blob
    const response = await fetch(imagePath);
    const blob = await response.blob();

    // Agregar la imagen al FormData con un nombre
    formData.append("imagen", {
      uri: imagePath,
      type: blob.type,
      name: "imagen.jpg",
    } as any);

    // Hacer la petición a la API
    const postResponse = await fetch(API_URL, {
      method: "POST",
      body: formData,
      headers: {
        "Content-Type": "multipart/form-data",
      },
    });

    if (postResponse.ok) {
      return await postResponse.json();
    }

    throw new Error("Error en la clasificación de la imagen.");
  } catch (error) {
    console.log("Error:", error);
    throw error;
  }
}

// async function handleClassification(imagePath: string) {
//     console.log(config.BACKEND_API_URL);
//   const status = await fetch(config.BACKEND_API_URL);

//   console.log(await status.json());
//   return "Clasificación exitosa";
// }
export { handleClassification };
