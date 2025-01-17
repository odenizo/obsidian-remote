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

# Add steps specific to Termux deployment
if [ "$TERMUX" = true ]; then
  echo "Setting up Termux environment..."

  # Step 3: Install additional dependencies for Termux
  bash deployment/termux/02_requirements.sh

  # Step 4: Set up the project in Termux
  bash deployment/termux/01_define_variables.sh

  echo "Termux setup complete."
fi
