#!/bin/bash

# Define environment variables and their default values
export CUSTOM_PORT=${CUSTOM_PORT:-8080}
export CUSTOM_HTTPS_PORT=${CUSTOM_HTTPS_PORT:-8443}
export CUSTOM_USER=${CUSTOM_USER:-""}
export PASSWORD=${PASSWORD:-""}
export SUBFOLDER=${SUBFOLDER:-""}
export TITLE=${TITLE:-"Obsidian"}
export FM_HOME=${FM_HOME:-"/vaults"}

# Add environment variables specific to Kamatera VM deployment
export KAMATERA_VM=${KAMATERA_VM:-false}
export KAMATERA_VM_USER=${KAMATERA_VM_USER:-"kamatera"}
export KAMATERA_VM_PASSWORD=${KAMATERA_VM_PASSWORD:-""}
export KAMATERA_VM_PORT=${KAMATERA_VM_PORT:-8080}
export KAMATERA_VM_HTTPS_PORT=${KAMATERA_VM_HTTPS_PORT:-8443}

# Add environment variables specific to Termux or Android
export TERMUX=${TERMUX:-false}
export TERMUX_USER=${TERMUX_USER:-"termux"}
export TERMUX_PASSWORD=${TERMUX_PASSWORD:-""}
export TERMUX_PORT=${TERMUX_PORT:-8080}
export TERMUX_HTTPS_PORT=${TERMUX_HTTPS_PORT:-8443}
qa