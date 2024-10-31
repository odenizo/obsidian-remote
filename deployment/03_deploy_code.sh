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

echo "Deployment complete. Access the application at http://localhost:${CUSTOM_PORT:-8080}/"
