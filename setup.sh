#!/bin/bash

# Ask for the initial project path
echo "Enter the absolute path where you want to create the project:"
read PROJECT_PATH

# Validate the input
if [ -z "$PROJECT_PATH" ]; then
  echo "Error: No path provided. Exiting..."
  exit 1
fi

# Navigate to the specified directory
cd "$PROJECT_PATH" || { echo "Error: Invalid path. Exiting..."; exit 1; }

# Ask for the project name
echo "Enter the project name:"
read PROJECT_NAME

if [ -z "$PROJECT_NAME" ]; then
  echo "Error: No project name provided. Exiting..."
  exit 1
fi

# Create a React Native CLI project
echo "Initializing React Native project..."
npx @react-native-community/cli init "$PROJECT_NAME"

# Navigate into the project
cd "$PROJECT_NAME" || { echo "Error: Failed to enter project directory. Exiting..."; exit 1; }

# Navigate into the iOS folder and install CocoaPods
echo "Running pod install..."
cd ios && pod install
cd .. # Go back to root

# 📂 Create `src` folder for the mobile app and add sub folders with README.md files
mkdir -p src/{forms,components,hooks,styles,assets/fonts,assets/images,assets/videos}

echo "📂 Setting up mobile source structure..."
echo "All mobile forms UI will be added here." > src/forms/README.md
echo "Components to be created here, ex. headers, footer, UI elements that can be used in multiple forms." > src/components/README.md
echo "Service/API calls specific to mobile only will go here." > src/hooks/README.md
echo "Styles specific to mobile only will go here." > src/styles/README.md
echo "Any assets specific to mobile to be placed here." > src/assets/README.md
echo "Place fonts here." > src/assets/fonts/README.md
echo "Place images here." > src/assets/images/README.md
echo "Place videos here." > src/assets/videos/README.md

# 📂 Create the root-level folders for shared assets & hooks
mkdir -p hooks styles assets/fonts assets/images assets/videos

echo "📂 Setting up root structure for shared code..."
echo "Service/API calls that can be used by both web and mobile go here." > hooks/README.md
echo "Styles specific that can be used by both web and mobile go here." > styles/README.md
echo "Any assets to be used universally go here." > assets/README.md
echo "Place fonts here." > assets/fonts/README.md
echo "Place images here." > assets/images/README.md
echo "Place videos here." > assets/videos/README.md

# 🌍 Create `web` folder and initialize a Vite project
echo "Setting up Vite web app..."
mkdir web
cd web
npm create vite@latest . -- --template react-ts
npm install
cd .. # Go back to project root

# 📂 Create `src` folder for the web app and add sub folders with README.md files
mkdir -p web/src/{forms,components,hooks,styles,assets/fonts,assets/images,assets/videos}

echo "📂 Setting up web source structure..."
echo "All web forms UI will be added here." > web/src/forms/README.md
echo "Components to be created here, ex. headers, footer, UI elements that can be used in multiple forms." > web/src/components/README.md
echo "Service/API calls specific to web only will go here." > web/src/hooks/README.md
echo "Styles specific to web only will go here." > web/src/styles/README.md
echo "Any assets specific to web to be placed here." > web/src/assets/README.md
echo "Place fonts here." > web/src/assets/fonts/README.md
echo "Place images here." > web/src/assets/images/README.md
echo "Place videos here." > web/src/assets/videos/README.md

# 📂 Create TypeScript declaration file for images
echo "Adding TypeScript declarations for images..."
cat <<EOT > declarations.d.ts
// Allow importing images in TypeScript
declare module "*.png" {
  const value: any;
  export default value;
}

declare module "*.jpg" {
  const value: any;
  export default value;
}

declare module "*.jpeg" {
  const value: any;
  export default value;
}

declare module "*.gif" {
  const value: any;
  export default value;
}

declare module "*.svg" {
  import React from "react";
  import { SvgProps } from "react-native-svg";
  const content: React.FC<SvgProps>;
  export default content;
}
EOT

# ✅ Final message
echo "✅ Setup complete! Your React Native and Vite projects are ready."
echo "Navigate to '$PROJECT_PATH/$PROJECT_NAME' to start working on your project."

# Open the project in VS Code
if command -v code &> /dev/null; then
    echo "Opening project in VS Code..."
    code "$PROJECT_PATH/$PROJECT_NAME"
else
    echo "VS Code not found. Please open the project manually."
fi