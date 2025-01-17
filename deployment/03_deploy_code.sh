#!/bin/bash

# Build and deploy the application

# Step 1: Build the Docker image
if ! docker build -t obsidian-remote:latest .; then
  echo "Error: Docker build failed."
  exit 1
fi

# Step 2: Run the Docker container
if ! docker run -d \
  -v ${VAULTS_PATH:-/path/to/vaults}:/vaults \
  -v ${CONFIG_PATH:-/path/to/config}:/config \
  -p ${CUSTOM_PORT:-8080}:${CUSTOM_PORT:-8080} \
  obsidian-remote:latest; then
  echo "Error: Docker run failed."
  exit 1
fi

# Step 3: Build and run the Smart Connect Electron app
if ! docker build -t smart-connect:latest ./smart-connect; then
  echo "Error: Docker build for Smart Connect failed."
  exit 1
fi

if ! docker run -d \
  -v ${SMART_CONNECT_PATH:-/path/to/smart-connect}:/smart-connect \
  -p ${SMART_CONNECT_PORT:-3000}:${SMART_CONNECT_PORT:-3000} \
  smart-connect:latest; then
  echo "Error: Docker run for Smart Connect failed."
  exit 1
fi

# Step 4: Install the Smart Connect Electron app from the Debian package
if ! dpkg -i /tmp/smart-connect.deb; then
  echo "Error: Smart Connect installation failed."
  exit 1
fi

echo "Deployment complete. Access the application at http://localhost:${CUSTOM_PORT:-8080}/ and Smart Connect at http://localhost:${SMART_CONNECT_PORT:-3000}/"
