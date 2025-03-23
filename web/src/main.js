import { jsx as _jsx, jsxs as _jsxs } from "react/jsx-runtime";
import React from "react";
import ReactDOM from "react-dom/client";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import SplashScreen from "./forms/SplashScreen";
import Home from "./forms/Home";
import "./index.css"; // Import global styles
ReactDOM.createRoot(document.getElementById("root")).render(_jsx(React.StrictMode, { children: _jsx(Router, { children: _jsxs(Routes, { children: [_jsx(Route, { path: "/", element: _jsx(SplashScreen, {}) }), _jsx(Route, { path: "/home", element: _jsx(Home, {}) })] }) }) }));
