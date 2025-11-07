import { Component } from "react";
import Productos from "./components/Productos";
import Layout from "./components/Layout";
import Title from "./components/Title";
import Navbar from "./components/Navbar";

const products_path = "/productos"; // automaticamente se extrae de public

class App extends Component {
  state = {
    products: [
      { name: "tomate", price: 1500, img: `${products_path}/tomate.jpg` },
      { name: "arbejas", price: 1500, img: `${products_path}/arbejas.jpg` },
      { name: "lechuga", price: 1500, img: `${products_path}/lechuga.jpg` },
    ],
  };

  render() {
    return (
      <div>
        <Navbar />
        <Layout>
          <Title />
          <Productos
            addToCart={() => console.log("agregado al carrito")}
            products={this.state.products}
          />
        </Layout>
      </div>
    );
  }
}

export default App;
