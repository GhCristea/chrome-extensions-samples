#!/bin/bash
# This script recursively finds lock files and removes the node_modules directory located in the same folder.

echo "Searching for node_modules in directories containing lock files..."

find . -type f \( -name "package-lock.json" -o -name "yarn.lock" -o -name "pnpm-lock.yaml" -o -name "bun.lockb" \) | while read -r lockfile; do
    dir=$(dirname "$lockfile")
    if [ -d "$dir/node_modules" ]; then
        echo "Removing $dir/node_modules..."
        rm -rf "$dir/node_modules"
    fi
done

echo "Node modules cleanup complete!"
