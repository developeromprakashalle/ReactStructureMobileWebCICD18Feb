# Use Node.js as the base image
FROM node:18

# Set working directory
WORKDIR /app

# Copy the package files first (for caching layers)
COPY package.json package-lock.json ./
COPY web/package.json web/package-lock.json ./web/

# Install dependencies at the root level
RUN npm install --legacy-peer-deps

# Copy the rest of the application files
COPY . /app

# Ensure static assets like images are copied
COPY assets/images /app/assets/images
RUN cp -r /app/assets/images /app/web/src/

# Change to the web directory
WORKDIR /app/web

# Install web app dependencies
RUN npm install --legacy-peer-deps

# Verify TypeScript and Vite installation (optional, useful for debugging)
RUN npx tsc --version
RUN npm run vite --version

# Build the web app
RUN npx tsc -b && npm run build

# Expose the Vite preview port
EXPOSE 4175

# Start the preview server
CMD ["npx", "vite", "preview", "--host", "0.0.0.0", "--port", "4175"]