#!/bin/bash

# Build and deploy the application

# Step 1: Build the Docker image
docker build -t obsidian-remote:latest .

# Step 2: Run the Docker container
docker run -d \
  -v ~/vsult:/vaults \
  -v ~/config:/config \
  -p 8080:8080 \
  -p 8443:8443 \
  obsidian-remote:latest

echo "Deployment complete. Access the application at http://localhost:8080/"
