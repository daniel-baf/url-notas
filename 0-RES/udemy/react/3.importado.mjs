// const chanchos = require("./3. export import");
// const { chanchosFelices, chanchosTristes } = require("./3. export import.mjs");
import chanchosFelices, {
  chanchosTristes,
  otrosChanchos,
  chanchosFeos,
  fn2,
} from "./3.export import.mjs";

console.log(chanchosFelices, chanchosTristes); // [ 'chancho 1', 'chancho 2', 'chancho 3' ] [ 'chancho 4', 'chancho 5', 'chancho 6' ]
console.log(otrosChanchos, chanchosFeos); // [ 'chancho 7', 'chancho 8', 'chancho 9' ]

fn2(); // fn2
