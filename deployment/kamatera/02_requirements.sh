#!/bin/bash

# List of requirements
REQUIREMENTS=(
  "curl"
  "libgtk-3-0"
  "libnotify4"
  "libatspi2.0-0"
  "libsecret-1-0"
  "libnss3"
  "desktop-file-utils"
  "fonts-noto-color-emoji"
  "git"
  "ssh-askpass"
  "docker" # Additional requirement for Kamatera VM deployment
  "docker-compose" # Additional requirement for Kamatera VM deployment
  "nginx" # Additional requirement for web access
)

# Install requirements
for requirement in "${REQUIREMENTS[@]}"; do
  if ! dpkg -s "$requirement" >/dev/null 2>&1; then
    echo "Installing $requirement..."
    sudo apt-get install -y "$requirement"
  else
    echo "$requirement is already installed."
  fi
done

# Configure nginx for web access
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
sudo systemctl restart nginx
