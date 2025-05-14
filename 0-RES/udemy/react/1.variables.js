console.log(miVariable); // undefined, ya que la variable no ha sido declarada

var miVariable = "variable global"; // genera un tipo de variable global

// console.log(variable); // variable global, let si lanza error si no ha sido declarada, al igual que const
let variable = "variable creada con let"; // es creada en el scope donde fue declarada, mientras que el var lo lleva globalmente
console.log(variable);


const constante = "constante creada con const";
// constante = "nuevo valor"; // no se puede reasignar un valor a una constante, ya que es constante