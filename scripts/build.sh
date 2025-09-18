#!/bin/bash

echo "=========================================="
echo "ARYE Configurator Build Script"
echo "========================================="
echo

# Find installer files in installers directory
cd "$(dirname "$0")/../installers"

# Look for .exe files that match the pattern arye-configurator-*.exe
DRIVER_FILES=(arye-configurator-*.exe)

if [ ! -f "${DRIVER_FILES[0]}" ]; then
    echo "ERROR: No installer files found in installers/"
    echo "Please place an installer file matching pattern: arye-configurator-*.exe"
    exit 1
fi

# If multiple installer files, use the newest one
DRIVER_FILE=""
LATEST_TIME=0
for file in "${DRIVER_FILES[@]}"; do
    if [ -f "$file" ]; then
        FILE_TIME=$(stat -f%m "$file" 2>/dev/null || stat -c%Y "$file" 2>/dev/null)
        if [ "$FILE_TIME" -gt "$LATEST_TIME" ]; then
            LATEST_TIME=$FILE_TIME
            DRIVER_FILE="$file"
        fi
    fi
done

if [ -z "$DRIVER_FILE" ]; then
    echo "ERROR: No valid installer files found!"
    exit 1
fi

echo "Found installer file: $DRIVER_FILE"

# Extract version from filename (e.g., arye-configurator-v1.0.1.3.exe -> v1.0.1.3)
VERSION=$(echo "$DRIVER_FILE" | sed -n 's/arye-configurator-\(v[0-9.]*\)\.exe/\1/p')

if [ -z "$VERSION" ]; then
    echo "ERROR: Could not extract version from filename: $DRIVER_FILE"
    echo "Expected format: arye-configurator-v1.0.1.3.exe"
    exit 1
fi

echo "Extracted version: $VERSION"
echo

# Create releases directory if it doesn't exist
mkdir -p ../releases

# Package installer file
echo "Creating release package..."
echo "Using file: $DRIVER_FILE"

# Use PowerShell on Windows to create zip files (since it's available on Windows runners)
if command -v powershell.exe &> /dev/null; then
    # Running on Windows with PowerShell available
    echo "Using PowerShell for compression..."
    powershell.exe -Command "Compress-Archive -Path '$DRIVER_FILE' -DestinationPath '../releases/arye-configurator-windows-$VERSION.zip' -Force"
    powershell.exe -Command "Compress-Archive -Path '$DRIVER_FILE' -DestinationPath '../releases/arye-configurator-windows-latest.zip' -Force"
elif command -v zip &> /dev/null; then
    # Use zip if available
    echo "Using zip for compression..."
    zip "../releases/arye-configurator-windows-$VERSION.zip" "$DRIVER_FILE"
    zip "../releases/arye-configurator-windows-latest.zip" "$DRIVER_FILE"
else
    echo "ERROR: No compression tool available"
    exit 1
fi

echo
echo "Build complete!"
echo "Package created: releases/arye-configurator-windows-$VERSION.zip"
echo "Installer version: $VERSION"
echo "=========================================="