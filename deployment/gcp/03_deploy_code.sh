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

# Add steps specific to GCP VM deployment
if [ "$GCP_VM" = true ]; then
  echo "Setting up GCP VM environment..."

  # Step 3: Install additional dependencies for GCP VM
  bash deployment/gcp/02_requirements.sh

  # Step 4: Set up the project in GCP VM
  bash deployment/gcp/01_define_variables.sh

  echo "GCP VM setup complete."
fi
