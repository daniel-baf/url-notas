const Rectangulo = class R {}; // clases no tienen hoisting

function Cuadrado() {} // las funciones tienen hoisting

const r = new Rectangulo();
console.log(r);

console.log(Rectangulo, Cuadrado);

console.log("------------------------------------");

class Chancho {
  // aca debemos hablar del constructor, se ejecuta cuando se crea una instancia de la clase
  #hambre = true; // atributo privado
  static estatico = 42; // atributo estatico

  constructor(estado) {
    this.estado = estado; // asignamos el estado al objeto
  }

  hablar() {
    console.log(
      `Soy un chancho y estoy ${this.estado}, tengo hambre: ${
        this.#hambre
      } mi estatico es: ${this.constructor.estatico}`
    );
  }

  comer() {
    console.log("El chancho esta comiendo");
    this.#hambre = false; // modificamos el atributo privado
    this.constructor.estatico = 43; // modificamos el atributo estático
  }
}

const chanchoFelix = new Chancho("feliz"); // no puede ser invocado sin el new
chanchoFelix.hablar();
chanchoFelix.comer();
chanchoFelix.hablar();
