const express = require("express");
const cors = require("cors"); // Importa cors
const multer = require("multer");
const tf = require("@tensorflow/tfjs-node");
const fs = require("fs");

const app = express();
const PORT = 3000;

app.use(cors()); // Habilita CORS
app.use(express.json());

// Configurar Multer para subir imágenes
const upload = multer({ dest: "uploads/" });

// Cargar el modelo de Teachable Machine
let model;
let classNames = [];

(async () => {
  try {
    model = await tf.loadLayersModel("file://modelo/model.json");
    console.log("Modelo cargado correctamente.");

    // Cargar nombres de las clases si metadata.json existe
    const metadataPath = "modelo/metadata.json";
    if (fs.existsSync(metadataPath)) {
      const metadata = JSON.parse(fs.readFileSync(metadataPath, "utf8"));
      classNames = metadata.labels || [];
      console.log("Metadata cargada correctamente.");
    }
  } catch (error) {
    console.error("Error al cargar el modelo:", error);
  }
})();

// Endpoint para clasificar imágenes
app.post("/clasificar", upload.single("imagen"), async (req, res) => {
  if (!model) {
    return res.status(503).json({ error: "El modelo aún no está listo." });
  }

  if (!req.file) {
    return res.status(400).json({ error: "No se proporcionó una imagen." });
  }

  try {
    // Leer la imagen y convertirla en tensor
    const imageBuffer = fs.readFileSync(req.file.path);
    const tensor = tf.node
      .decodeImage(imageBuffer)
      .resizeNearestNeighbor([224, 224]) // Tamaño esperado por Teachable Machine
      .expandDims(0)
      .toFloat()
      .div(255.0);

    // Obtener predicciones
    const predictions = await model.predict(tensor).data();

    // Formatear la respuesta con id, nombre y porcentaje
    const formattedPredictions = [];

    predictions.forEach((element, index) => {
      formattedPredictions.push({
        id: index,
        nombre: classNames[index] || `Clase ${index}`,
        porcentaje: (element * 100).toFixed(2),
      });
    });

    // Eliminar archivo temporal
    fs.unlinkSync(req.file.path);

    return res.json(formattedPredictions);
  } catch (error) {
    res.status(500).json({ error: "Error al procesar la imagen." });
  }
});

app.get("/", (req, res) => {
  return res.json({ message: "API de clasificación de imágenes" });
});

// Iniciar el servidor
app.listen(PORT, () => {
  console.log(`Servidor en http://localhost:${PORT}`);
});
