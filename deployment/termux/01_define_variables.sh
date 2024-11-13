#!/bin/bash

# Define environment variables and their default values
export CUSTOM_PORT=${CUSTOM_PORT:-8080}
export CUSTOM_HTTPS_PORT=${CUSTOM_HTTPS_PORT:-8443}
export CUSTOM_USER=${CUSTOM_USER:-""}
export PASSWORD=${PASSWORD:-""}
export SUBFOLDER=${SUBFOLDER:-""}
export TITLE=${TITLE:-"Obsidian"}
export FM_HOME=${FM_HOME:-"/vaults"}

# Add environment variables specific to Termux deployment
export TERMUX=${TERMUX:-true}
export TERMUX_USER=${TERMUX_USER:-"termux"}
export TERMUX_PASSWORD=${TERMUX_PASSWORD:-""}
export TERMUX_PORT=${TERMUX_PORT:-8080}
export TERMUX_HTTPS_PORT=${TERMUX_HTTPS_PORT:-8443}
