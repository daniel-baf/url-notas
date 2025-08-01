// import logo from './logo.svg';
// import './App.css';

// function App() {
//   return (
//     <div className="App">
//       <header className="App-header">
//         <img src={logo} className="App-logo" alt="logo" />
//         <p>
//           Edit <code>src/App.js</code> and save to reload.
//         </p>
//         <a
//           className="App-link"
//           href="https://reactjs.org"
//           target="_blank"
//           rel="noopener noreferrer"
//         >
//           Learn React
//         </a>
//       </header>
//     </div>
//   );
// }

// export default App;

////////////////////////////////////
////////////////////////////////////
//            HOOKS
////////////////////////////////////
////////////////////////////////////
import { Component } from "react";

class Button extends Component {
  constructor(props) {
    super(props); // hace referencia a la clase padre, Component
    console.log(`ejecutando metodo de constructor para el componente Button`);
    console.log("constructor", this.props);
  }

  componentDidMount() {
    // no recibe ningun argumento, se usa para el setup inicial
    console.log("componentDidMount Button");
  }

  componentDidUpdate(prevProps, prevState) {
    // se ejecuta cuando el componente se actualiza
    console.log("componentDidUpdate Button", prevProps, prevState);
  }

  componentWillUnmount() {
    // se ejecuta cuando el componente se desmonta
    console.log("componentWillUnmount ", this.props, this.state);
  }

  render() {
    console.log(`ejecutando metodo de render para el componente Button`);
    return <button>Boton</button>;
  }
}

class App extends Component {
  state = { valor: 3 };

  render() {
    console.log(this.state);

    return (
      <div>
        <h1>Componente App</h1>
        <p>Este es el contenido de mi componente</p>

        {/* EJEMPLIFICAR EL USO DE WILLUNMOUNT */}
        {this.state.valor === 3 && <Button chanchito="feliz" />}
        <button
          className={`${this.state.valor}`}
          onClick={() => this.setState({ valor: 2 })}
        >
          Enviar
        </button>
      </div>
    );
  }
}

export default App;
