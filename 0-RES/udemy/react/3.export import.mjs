const chanchosFelices = ["chancho 1", "chancho 2", "chancho 3"];
export const chanchosTristes = ["chancho 4", "chancho 5", "chancho 6"]; // exportar una constante
export const otrosChanchos = ["chancho 7", "chancho 8", "chancho 9"]; // exportar una constante
const chanchosFeos = ["chancho 10", "chancho 11", "chancho 12"];

function fn2() {
  console.log("fn2");
}

// module.exports = {
//   chanchosFelices,
//   chanchosTristes,
// }; // forma antigua de exportar

export default chanchosFelices; // forma nueva de exportar
export { chanchosFeos, fn2 }; // forma nueva de exportar
