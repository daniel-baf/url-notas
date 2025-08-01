import { Component } from "react";

const styles = {
  navbar: {
    display: "flex",
    flexDirection: "row",
    alignItems: "center",
    height: "100px",
    justifyContent: "space-between",
    position: "relative",
    padding: "0 50px",
    boxShadow: "0 2px 4px 0 rgba(0,0,0,0.1)",
  },
};

class Navbar extends Component {
  render() {
    return (
      <nav style={styles.navbar}>
        <p>LOGO</p>
        <p>CARRO</p>
      </nav>
    );
  }
}

export default Navbar;
