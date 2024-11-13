#!/bin/bash

# Define environment variables and their default values
export CUSTOM_PORT=${CUSTOM_PORT:-8080}
export CUSTOM_HTTPS_PORT=${CUSTOM_HTTPS_PORT:-8443}
export CUSTOM_USER=${CUSTOM_USER:-""}
export PASSWORD=${PASSWORD:-""}
export SUBFOLDER=${SUBFOLDER:-""}
export TITLE=${TITLE:-"Obsidian"}
export FM_HOME=${FM_HOME:-"/vaults"}

# Add environment variables specific to Codespaces deployment
export CODESPACES=${CODESPACES:-false}
export CODESPACES_USER=${CODESPACES_USER:-"vscode"}
export CODESPACES_PASSWORD=${CODESPACES_PASSWORD:-""}
export CODESPACES_PORT=${CODESPACES_PORT:-8080}
export CODESPACES_HTTPS_PORT=${CODESPACES_HTTPS_PORT:-8443}
