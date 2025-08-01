using System;

namespace PerceptronXOR
{
    class Program
    {
        static Random rnd = new Random();
        static double LearningRate = 0.1;

        static void Main(string[] args)
        {
            Console.WriteLine("Perceptrón de una capa para XOR");

            // Datos de entrenamiento para XOR con una nueva característica x3 = x1 * x2
            double[,] inputs = { { 0, 0, 0 }, { 0, 1, 0 }, { 1, 0, 0 }, { 1, 1, 1 } };
            int[] expectedOutputs = { 0, 1, 1, 0 };

            // Inicializar pesos aleatorios
            double[] weights = { rnd.NextDouble(), rnd.NextDouble(), rnd.NextDouble(), rnd.NextDouble() };

            int epochs = 10000;

            for (int epoch = 0; epoch < epochs; epoch++)
            {
                bool hasError = false;
                for (int i = 0; i < 4; i++)
                {
                    double x1 = inputs[i, 0];
                    double x2 = inputs[i, 1];
                    double x3 = inputs[i, 2];
                    int expected = expectedOutputs[i];

                    // Cálculo de la salida del perceptrón con función de activación escalón
                    double sum = x1 * weights[0] + x2 * weights[1] + x3 * weights[2] + weights[3];
                    int output = sum > 0 ? 1 : 0;

                    // Calcular error
                    int error = expected - output;
                    if (error != 0)
                    {
                        hasError = true;
                        // Ajustar pesos
                        weights[0] += LearningRate * error * x1;
                        weights[1] += LearningRate * error * x2;
                        weights[2] += LearningRate * error * x3;
                        weights[3] += LearningRate * error; // Sesgo
                    }
                }

                if (!hasError)
                {
                    Console.WriteLine($"Entrenamiento finalizado en la época {epoch}");
                    break;
                }
            }

            Console.WriteLine("\nResultados finales:");
            for (int i = 0; i < 4; i++)
            {
                double x1 = inputs[i, 0];
                double x2 = inputs[i, 1];
                double x3 = inputs[i, 2];
                double sum = x1 * weights[0] + x2 * weights[1] + x3 * weights[2] + weights[3];
                int output = sum > 0 ? 1 : 0;

                Console.WriteLine($"Entrada: {x1} XOR {x2} = {output} (Esperado: {expectedOutputs[i]})");
            }
        }
    }
}
