function Fn() {
  // objeto literal -> {}
  // this -> objeto vacio
  // this.prop = "hola" -> { prop: "hola" }
  this.prop = "hola";
  return "chanchito feliz";
}

const r = Fn();
console.log(r);

// creacion como objeto
const r2 = new Fn();
console.log(r2);
// al crear un objeto con new, se crea un objeto vacio, y se le asigna el this al objeto vacio
// ignora el return de la funcion, y retorna el objeto creado

console.log(r2.__proto__);

// podemos modificar el prototipo de un objeto
Fn.prototype.saludar = function () {
  console.log("Hola");
};

console.log(r2.__proto__);

// para que no sea anonima, se le asigna un nombre

// podemos modificar el prototipo de un objeto
Fn.prototype.despedir = function despedir() {
  console.log("adios");
};

console.log(r2.__proto__);

// las arrow functions

const fatFn = () => {
  console.log(this);
};

// const fatFnDeclarada = new fatFn(); -> no se puede, arroja un error

console.log(fatFnDeclarada);
