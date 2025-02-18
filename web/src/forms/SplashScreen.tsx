import React, { useEffect } from "react";
import { useNavigate } from "react-router-dom";
import logo from "../../../assets/images/logo.png"; // ✅ Import image

const SplashScreen: React.FC = () => {
  const navigate = useNavigate();

  useEffect(() => {
    setTimeout(() => {
      navigate("/home"); // Navigate after 5 seconds
    }, 5000);
  }, [navigate]);

  return (
    <div style={styles.container}>
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
    backgroundColor: "#fff",
  },
  logo: {
    width: "200px",
    height: "200px",
    objectFit: "contain",
  },
};

export default SplashScreen;