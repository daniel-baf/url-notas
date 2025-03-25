# Instalacion y carga de paquetes
install.packages("tidyverse", type="source")
install.packages(c('caret', 'neuralnet'))

library(tidyverse)
library(caret)
library(neuralnet)

# Cargar datos
datos = iris

# Convertir la variable 'Species' en variables dummy (one-hot encoding)
datos_dummy = cbind(datos, model.matrix(~ Species - 1, data=datos))

# Separaci?n en entrenamiento y prueba
set.seed(42)  # Fijar semilla para reproducibilidad
muestra = createDataPartition(datos_dummy$Species, p=0.8, list=FALSE)
train = datos_dummy[muestra,]
test = datos_dummy[-muestra,]

# Entrenar la red neuronal con variables dummy
red.neuronal = neuralnet(Speciessetosa + Speciesversicolor + Speciesvirginica ~ 
                           Sepal.Length + Sepal.Width + Petal.Length + Petal.Width, 
                         data = train, hidden = c(3,3), linear.output = FALSE)

# Visualizar la red neuronal
plot(red.neuronal)

# Aplicar la red al conjunto de pruebas
prediccion = compute(red.neuronal, test[, c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width")])$net.result

# Decodificar la predicci?n: elegir la clase con mayor probabilidad
colnames(prediccion) <- c("Setosa", "Versicolor", "Virginica")
predicted_class <- apply(prediccion, 1, which.max)

# Convertir a nombres de especies
species_labels <- c("Setosa", "Versicolor", "Virginica")
test$Especie.Pred <- species_labels[predicted_class]

# Evaluaci?n del modelo: matriz de confusi?n
conf_matrix <- table(test$Species, test$Especie.Pred)
print(conf_matrix)

# Calcular precisi?n
accuracy <- sum(diag(conf_matrix)) / sum(conf_matrix) * 100
cat("Precisi?n de la red neuronal:", accuracy, "%\n")


##################################################
##############        clase 2       ##############                
##################################################
