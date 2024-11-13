#!/bin/bash

# Define environment variables and their default values
export CUSTOM_PORT=${CUSTOM_PORT:-8080}
export CUSTOM_HTTPS_PORT=${CUSTOM_HTTPS_PORT:-8443}
export CUSTOM_USER=${CUSTOM_USER:-""}
export PASSWORD=${PASSWORD:-""}
export SUBFOLDER=${SUBFOLDER:-""}
export TITLE=${TITLE:-"Obsidian"}
export FM_HOME=${FM_HOME:-"/vaults"}

# Add environment variables specific to GCP VM deployment
export GCP_VM=${GCP_VM:-false}
export GCP_VM_USER=${GCP_VM_USER:-"gcp"}
export GCP_VM_PASSWORD=${GCP_VM_PASSWORD:-""}
export GCP_VM_PORT=${GCP_VM_PORT:-8080}
export GCP_VM_HTTPS_PORT=${GCP_VM_HTTPS_PORT:-8443}
