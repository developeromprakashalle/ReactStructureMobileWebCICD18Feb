import { jsx as _jsx, jsxs as _jsxs } from "react/jsx-runtime";
import logo from "../../../assets/images/logo.png"; // ✅ Import image
const Home = () => {
    return (_jsxs("div", { style: styles.container, children: [_jsx("h1", { children: "Welcome to the Home Page!" }), _jsx("img", { src: logo, alt: "Logo", style: styles.logo })] }));
};
// CSS-in-JS styles
const styles = {
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
