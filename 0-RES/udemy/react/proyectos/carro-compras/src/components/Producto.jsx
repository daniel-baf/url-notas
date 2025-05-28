import { Component } from "react";
import Button from "./Button";

const styles = {
  product: {
    border: "solid 1px #eee",
    boxShadow: "0 5px 5px rgba(0, 0, 0, 0.1)",
    width: "30%",
    padding: "10px 15px",
  },
  img: {
    width: "100%",
  },
};

class Producto extends Component {
  render() {
    const { product, addToCart } = this.props;

    return (
      <div style={styles.product}>
        <img alt={product.name} src={product.img} style={styles.img} />
        <h3>{product.name}</h3>
        <p>{product.price}</p>
        <Button onClick={() => addToCart(product)}>Agregar al carro</Button>
      </div>
    );
  }
}

export default Producto;
