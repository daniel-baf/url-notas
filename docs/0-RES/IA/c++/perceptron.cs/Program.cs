using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Perceptron
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Perceptrón de una capa");

            // Conjunto de datos de entrenamiento (entradas y salida esperada)
            int[,] datos = { { 1, 1, 1 }, { 1, 0, 0 }, { 0, 1, 0 }, { 0, 0, 0 } };

            Random aleatorio = new Random();

            // Pesos inicializados aleatoriamente (incluye sesgo)
            double[] pesos = { aleatorio.NextDouble(), aleatorio.NextDouble(), aleatorio.NextDouble() };

            double alpha = 0.1; // Tasa de aprendizaje
            int epocas = 0;
            bool aprendizaje = true;

            while (aprendizaje)
            {
                aprendizaje = false;

                for (int i = 0; i < 4; i++)
                {
                    // Entrada y salida esperada
                    double x1 = datos[i, 0];
                    double x2 = datos[i, 1];
                    int salidaEsperada = datos[i, 2];

                    // Cálculo de la salida del perceptrón
                    double salidaDouble = x1 * pesos[0] + x2 * pesos[1] + pesos[2];
                    int salidaInt = salidaDouble > 0 ? 1 : 0;

                    // Ajuste de pesos si la predicción es incorrecta
                    if (salidaInt != salidaEsperada)
                    {
                        aprendizaje = true;
                        double error = salidaEsperada - salidaInt;
                        pesos[0] += alpha * error * x1;
                        pesos[1] += alpha * error * x2;
                        pesos[2] += alpha * error; // Sesgo
                    }
                }

                epocas++;

                // Mostrar resultados parciales después de cada época
                Console.WriteLine($"Época: {epocas}");
                Console.WriteLine($"Pesos: p0={pesos[0]:F4}, p1={pesos[1]:F4}, p2={pesos[2]:F4}");
            }

            Console.WriteLine("\nEntrenamiento finalizado.");
            Console.WriteLine($"Número total de épocas: {epocas}");

            // Prueba final del perceptrón entrenado
            Console.WriteLine("\nResultados finales:");
            for (int i = 0; i < 4; i++)
            {
                double x1 = datos[i, 0];
                double x2 = datos[i, 1];
                int salidaEsperada = datos[i, 2];

                double salidaDouble = x1 * pesos[0] + x2 * pesos[1] + pesos[2];
                int salidaInt = salidaDouble > 0 ? 1 : 0;

                Console.WriteLine($"Entrada: {x1} AND {x2} = {salidaEsperada}, Perceptrón: {salidaInt}");
            }
        }
    }
}
