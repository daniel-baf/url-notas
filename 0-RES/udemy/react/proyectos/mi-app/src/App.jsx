import { Component } from "react";

class Input extends Component {
  render() {
    const { valor, onChange, id } = this.props;

    return <input value={valor} onChange={onChange} id={id} />;
  }
}

class App extends Component {
  constructor(props) {
    super(props);

    this.state = {
      nombre: "",
      apellido: "",
    };
  }

  updateValues = (props, value) => {
    this.setState({ [props]: value }); // propiedades dinamias
  };

  render() {
    return (
      <div>
        <p>
          Nombre completo {this.state.nombre} {this.state.apellido}
        </p>

        <Input
          value={this.state.nombre}
          onChange={(e) => this.updateValues("nombre", e.target.value)}
          id="nombre"
        />
        <Input
          value={this.state.apellido}
          onChange={(e) => this.updateValues("apellido", e.target.value)}
          id="apellido"
        />
      </div>
    );
  }
}

export default App;
