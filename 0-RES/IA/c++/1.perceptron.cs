using System;
using System.collections.Generic;
using System.Ling;
using System.Threading.Tasks;

// Ejemplo de perceptron

namespace Perceptron
{
    // clase para el bloque de codigo

    class Program
    {
        static void Main(string[] args) 
        { // conjunto de datos para entrenamiento

            int[,] datos = ({1,1,1}, {1,0,0}, {0,1,0}, {0,0,0});

            Random aleatorio = new Random();

            double[] pesos = {aleatorio.NextDouble(), aleatorio.NextDouble(), aleatorio.NextDouble()};
            
        }
    }
}