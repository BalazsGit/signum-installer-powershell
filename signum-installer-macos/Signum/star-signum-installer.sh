#!/bin/bash

# Enable error handling
set -euo pipefail

# Ensure the script is executable
if [[ ! -x "$0" ]]; then
    chmod +x "$0"
    echo "The script is now executable."
    exec "$0" "$@"
    exit
fi

# Define variables
POWERSHELL_VERSION="7.4.6"
POWERSHELL_DIR="PowerShell"
POWERSHELL_ZIP="PowerShell-$POWERSHELL_VERSION-osx-x64.tar.gz"
POWERSHELL_UNZIP="PowerShell-$POWERSHELL_VERSION-osx-x64"
POWERSHELL_EXEC="$POWERSHELL_DIR/$POWERSHELL_UNZIP/pwsh"
POWERSHELL_URL="https://github.com/PowerShell/PowerShell/releases/download/v$POWERSHELL_VERSION/PowerShell-$POWERSHELL_VERSION-osx-x64.tar.gz"

# Navigate to the script's directory
cd "$(dirname "$0")"

# Install Portable PowerShell
echo "Installing Portable PowerShell v$POWERSHELL_VERSION..."

# Create PowerShell directory if it doesn't exist
if [[ ! -d "$POWERSHELL_DIR" ]]; then
    mkdir -p "$POWERSHELL_DIR"
    echo "Created directory: $POWERSHELL_DIR"
else
    echo "Directory already exists: $POWERSHELL_DIR"
fi

# Download PowerShell if not already downloaded
if [[ -f "$POWERSHELL_DIR/$POWERSHELL_ZIP" ]]; then
    echo "$POWERSHELL_ZIP already downloaded."
else
    echo "Downloading PowerShell..."
    curl -L -o "$POWERSHELL_DIR/$POWERSHELL_ZIP" "$POWERSHELL_URL"
fi

# Extract PowerShell if not already extracted
if [[ -d "$POWERSHELL_DIR/$POWERSHELL_UNZIP" ]]; then
    echo "$POWERSHELL_UNZIP already installed."
else
    echo "Extracting PowerShell to $POWERSHELL_DIR/$POWERSHELL_UNZIP..."
    mkdir -p "$POWERSHELL_DIR/$POWERSHELL_UNZIP"
    tar -xzf "$POWERSHELL_DIR/$POWERSHELL_ZIP" -C "$POWERSHELL_DIR/$POWERSHELL_UNZIP" --strip-components=1
    echo "PowerShell installed successfully."
fi

# Run Signum installer using the portable PowerShell
echo "Starting Signum installer..."
"$POWERSHELL_EXEC" -ExecutionPolicy Bypass -File "./signum-installer.ps1"
