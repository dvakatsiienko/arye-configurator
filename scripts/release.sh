#!/bin/bash

# Release script for ARYE Configurator
# Usage: ./scripts/release.sh

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "=========================================="
echo "ARYE Configurator Release Script"
echo "========================================="
echo

# Check for installer files in installers directory
cd "$(dirname "$0")/../installers"

# Look for .exe files that match the pattern arye-configurator-*.exe
DRIVER_FILES=(arye-configurator-*.exe)

if [ ! -f "${DRIVER_FILES[0]}" ]; then
    echo -e "${RED}ERROR: No installer files found in installers/${NC}"
    echo "Please place an installer file matching pattern: arye-configurator-v*.exe"
    echo "Example: arye-configurator-v1.0.1.3.exe"
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
    echo -e "${RED}ERROR: No valid installer files found!${NC}"
    exit 1
fi

echo -e "${GREEN}Found installer file: $DRIVER_FILE${NC}"

# Extract version from filename (e.g., arye-configurator-v1.0.1.3.exe -> v1.0.1.3)
VERSION=$(echo "$DRIVER_FILE" | sed -n 's/arye-configurator-\(v[0-9.]*\)\.exe/\1/p')

if [ -z "$VERSION" ]; then
    echo -e "${RED}ERROR: Could not extract version from filename: $DRIVER_FILE${NC}"
    echo "Expected format: arye-configurator-v1.0.1.3.exe"
    exit 1
fi

echo -e "${GREEN}Installer version: $VERSION${NC}"
echo

# Go back to repo root
cd ..

# Check for uncommitted changes
if ! git diff --quiet || ! git diff --staged --quiet; then
    echo -e "${YELLOW}Warning: You have uncommitted changes${NC}"
    read -p "Do you want to continue? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Release cancelled"
        exit 1
    fi
fi

# Make sure we're on main branch
CURRENT_BRANCH=$(git branch --show-current)
if [ "$CURRENT_BRANCH" != "main" ]; then
    echo -e "${YELLOW}Warning: You are on branch '$CURRENT_BRANCH', not 'main'${NC}"
    read -p "Do you want to continue? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Release cancelled"
        exit 1
    fi
fi

# Pull latest changes
echo "📡 Pulling latest changes from remote..."
git pull origin main

# Create release tag
TAG_NAME="$VERSION"

# Show what will be released
echo ""
echo "📋 Release Summary:"
echo "==================="
echo "Installer file: $DRIVER_FILE"
echo "Version: $VERSION"
echo "Tag: $TAG_NAME"
echo ""

# Check if tag already exists
if git tag -l | grep -q "^$TAG_NAME$"; then
    echo -e "${YELLOW}Warning: Tag $TAG_NAME already exists${NC}"
    read -p "Do you want to delete and recreate it? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        git tag -d "$TAG_NAME"
        echo "Deleted existing tag $TAG_NAME"
    else
        echo "Release cancelled"
        exit 1
    fi
fi

# Get recent commits that will be included
echo "Recent commits to be included in release notes:"
echo "------------------------------------------------"
git log --oneline --no-merges --perl-regexp --author="^(?!.*github-actions)" --grep="^🚀 release:|^📜 docs: update changelog" --invert-grep -5
echo ""

# Confirm release
read -p "Do you want to create release $TAG_NAME? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Release cancelled"
    exit 1
fi

# Generate changelog
echo "📝 Generating changelog..."
./scripts/update-changelog.sh

# Commit changelog if there are changes
if ! git diff --quiet CHANGELOG.md; then
    echo "📝 Committing changelog update..."
    git add CHANGELOG.md
    git commit -m "📝 changelog: update for $TAG_NAME release"
fi

# Create and push tag
echo "🏷️  Creating tag $TAG_NAME..."
git tag -a "$TAG_NAME" -m "Release $TAG_NAME

Installer: $DRIVER_FILE
$(git log --oneline --no-merges --perl-regexp --author="^(?!.*github-actions)" --grep="^🚀 release:|^📜 docs: update changelog" --invert-grep -5)"

# Function to safely push with retry logic
safe_push() {
    local max_retries=3
    local retry_count=0

    while [ $retry_count -lt $max_retries ]; do
        echo "📤 Attempting to push to remote (attempt $((retry_count + 1))/$max_retries)..."

        if git push origin main; then
            echo "✅ Successfully pushed main branch"
            break
        else
            echo "❌ Push failed, pulling latest changes..."
            git pull origin main --no-edit
            retry_count=$((retry_count + 1))

            if [ $retry_count -eq $max_retries ]; then
                echo "💥 Failed to push after $max_retries attempts"
                exit 1
            fi

            echo "🔄 Retrying push..."
        fi
    done

    # Push the tag (tags don't usually conflict)
    echo "📤 Pushing tag $TAG_NAME..."
    git push origin "$TAG_NAME"
}

# Push commits and tag with retry logic
safe_push

echo ""
echo -e "${GREEN}✅ Release $TAG_NAME created successfully!${NC}"
echo ""
echo "GitHub Actions will now:"
echo "  1. Build the installer package"
echo "  2. Create GitHub release"
echo "  3. Upload installer artifact"
echo ""
echo "Monitor the release at:"
echo "https://github.com/dvakatsiienko/arye-configurator/actions"
echo ""
echo "Once complete, the release will be available at:"
echo "https://github.com/dvakatsiienko/arye-configurator/releases/tag/$TAG_NAME"