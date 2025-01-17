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
