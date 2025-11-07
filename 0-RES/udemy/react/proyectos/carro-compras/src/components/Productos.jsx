import { Component } from "react";
import Producto from "./Producto";

const styles = {
  products: {
    display: "flex",
    flexDirection: "row",
    justifyContent: "space-between",
  },
};

class Productos extends Component {
  render() {
    const { products, addToCart } = this.props;

    return (
      <div style={styles.products}>
        {products.map((product) => (
          <Producto
            key={product.name}
            product={product}
            addToCart={addToCart}
          />
        ))}
      </div>
    );
  }
}

export default Productos;
