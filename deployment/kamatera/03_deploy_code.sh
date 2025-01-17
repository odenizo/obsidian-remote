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

# Add steps to ensure accessibility via a web browser on an Android phone
if [ "$TERMUX" = true ]; then
  echo "Setting up Termux environment..."

  # Step 5: Install nginx for web access
  sudo apt-get install -y nginx

  # Step 6: Configure nginx to proxy requests to the Docker container
  sudo bash -c 'cat > /etc/nginx/sites-available/obsidian <<EOF
server {
    listen 80;
    server_name localhost;

    location / {
        proxy_pass http://localhost:8080;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
    }
}
EOF'

  sudo ln -s /etc/nginx/sites-available/obsidian /etc/nginx/sites-enabled/

  # Step 7: Start nginx service
  sudo systemctl restart nginx

  echo "Termux setup complete. Access the application at http://localhost/"
fi
