#!/bin/bash

# Build and deploy the application

# Step 1: Build the Docker image
docker build -t obsidian-remote:latest .

# Step 2: Run the Docker container
docker run -d \
  -v /path/to/vaults:/vaults \
  -v /path/to/config:/config \
  -p 8080:8080 \
  obsidian-remote:latest

echo "Deployment complete. Access the application at http://localhost:8080/"

# Add steps specific to Kamatera VM deployment
if [ "$KAMATERA_VM" = true ]; then
  echo "Setting up Kamatera VM environment..."

  # Step 3: Install additional dependencies for Kamatera VM
  bash deployment/kamatera/02_requirements.sh

  # Step 4: Set up the project in Kamatera VM
  bash deployment/kamatera/01_define_variables.sh

  echo "Kamatera VM setup complete."
fi
