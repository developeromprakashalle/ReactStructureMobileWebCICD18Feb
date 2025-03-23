import { jsx as _jsx } from "react/jsx-runtime";
import { useEffect } from "react";
import { useNavigate } from "react-router-dom";
import logo from "../../../assets/images/logo.png"; // ✅ Import image
const SplashScreen = () => {
    const navigate = useNavigate();
    useEffect(() => {
        setTimeout(() => {
            navigate("/home"); // Navigate after 5 seconds
        }, 5000);
    }, [navigate]);
    return (_jsx("div", { style: styles.container, children: _jsx("img", { src: logo, alt: "Logo", style: styles.logo }) }));
};
// CSS-in-JS styles
const styles = {
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
