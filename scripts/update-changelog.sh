#!/bin/bash

# Script to update changelog.md with commits between releases

CHANGELOG="CHANGELOG.md"

# Get all tags sorted by version
TAGS=$(git tag -l --sort=-version:refname)

# Start fresh changelog
cat > $CHANGELOG << 'EOF'
# Changelog

All notable changes to ARYE Configurator are documented here.

EOF

# Convert tags to array
TAG_ARRAY=($TAGS)

# Check for unreleased commits (commits since last tag)
if [ ${#TAG_ARRAY[@]} -gt 0 ]; then
    LATEST_TAG=${TAG_ARRAY[0]}
    UNRELEASED_COMMITS=$(git log --oneline --no-merges --perl-regexp --author="^(?!.*github-actions)" --grep="^🚀 release:|^📜 docs: update changelog" --invert-grep $LATEST_TAG..HEAD | sed 's/^\([a-f0-9]\{7\}\)[a-f0-9]* \(.*\)/- [\1](https:\/\/github.com\/dvakatsiienko\/arye-configurator\/commit\/\1): \2/')

    # Only add Unreleased section if there are new commits
    if [ -n "$UNRELEASED_COMMITS" ]; then
        echo "## [Unreleased]" >> $CHANGELOG
        echo "" >> $CHANGELOG
        echo "$UNRELEASED_COMMITS" >> $CHANGELOG
        echo "" >> $CHANGELOG
    fi
fi

# Generate changelog for each tag
for i in "${!TAG_ARRAY[@]}"; do
    TAG=${TAG_ARRAY[$i]}
    NEXT_TAG=${TAG_ARRAY[$((i+1))]}

    # Get tag date
    TAG_DATE=$(git log -1 --format=%ai $TAG | cut -d' ' -f1)

    echo "## [$TAG] - $TAG_DATE" >> $CHANGELOG
    echo "" >> $CHANGELOG

    if [ -z "$NEXT_TAG" ]; then
        # Oldest tag - show all commits up to this tag
        git log --oneline --no-merges --perl-regexp --author="^(?!.*github-actions)" --grep="^🚀 release:|^📜 docs: update changelog" --invert-grep $TAG | sed 's/^\([a-f0-9]\{7\}\)[a-f0-9]* \(.*\)/- [\1](https:\/\/github.com\/dvakatsiienko\/arye-configurator\/commit\/\1): \2/' >> $CHANGELOG
    else
        # Show commits between this tag and the previous one
        git log --oneline --no-merges --perl-regexp --author="^(?!.*github-actions)" --grep="^🚀 release:|^📜 docs: update changelog" --invert-grep $NEXT_TAG..$TAG | sed 's/^\([a-f0-9]\{7\}\)[a-f0-9]* \(.*\)/- [\1](https:\/\/github.com\/dvakatsiienko\/arye-configurator\/commit\/\1): \2/' >> $CHANGELOG
    fi

    echo "" >> $CHANGELOG
done

echo "Changelog updated!"

# Auto-commit if there are changes
if ! git diff --quiet CHANGELOG.md; then
    echo "Committing changelog updates..."
    git add CHANGELOG.md
    git commit -m "📜 docs: update changelog"
    echo "Changelog committed successfully!"
else
    echo "No changes to commit."
fi