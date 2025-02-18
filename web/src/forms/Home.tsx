import React from "react";
import logo from "../../../assets/images/logo.png"; // ✅ Import image

const Home: React.FC = () => {
  return (
    <div style={styles.container}>
      <h1>Welcome to the Home Page!</h1>
      <img src={logo} alt="Logo" style={styles.logo} />
    </div>
  );
};

// CSS-in-JS styles
const styles: { [key: string]: React.CSSProperties } = {
  container: {
    display: "flex",
    justifyContent: "center",
    alignItems: "center",
    height: "100vh",
    backgroundColor: "#f5f5f5",
    fontFamily: "Arial, sans-serif",
  },
};

export default Home;