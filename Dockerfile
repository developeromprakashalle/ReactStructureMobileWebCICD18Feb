# First Stage: Build the React/Vite App
FROM node:18-alpine AS build

# Set working directory
WORKDIR /app

# Copy package.json files first (for caching)
COPY package.json package-lock.json ./
COPY web/package.json web/package-lock.json ./web/

# Install dependencies at the root level
#RUN npm install

# Copy the rest of the application files
COPY . /app

# Copy static assets (optional)
COPY assets/images /app/assets/images
RUN cp -r /app/assets/images /app/web/src/

# Change to web directory
WORKDIR /app/web

# Install dependencies inside the web directory
RUN npm install

# Verify TypeScript and Vite installation
#RUN npx tsc --version
#RUN npm run vite --version

# Build the Vite web app
RUN npm run build

ENV PORT=8080

EXPOSE 8080

CMD [ "npm", "run", "dev"]