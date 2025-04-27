#!/usr/bin/env bash

# Store the failed builds
declare -a failed_builds

# Function to find and process kustomization.yaml files
process_kustomizations() {
    local dir="$1"
    echo "Root dir: $dir, pwd: $(pwd)"
    for file in $(find "$dir" -type f -name "kustomization.yaml"); do
        echo "Processing: $file in $(dirname "$file")"
        if ! kustomize build "$(dirname "$file")" > /dev/null; then
            echo "Failed: $file"
            failed_builds+=("$file")
        fi
    done
}

# Start processing from the current directory
process_kustomizations "."

# Report results
if [ ${#failed_builds[@]} -eq 0 ]; then
    echo "All kustomize builds succeeded."
else
    echo "The following kustomize builds failed:"
    for failed in "${failed_builds[@]}"; do
        echo "  - $failed"
    done
    exit 1
fi
