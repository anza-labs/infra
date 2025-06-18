#!/usr/bin/env bash

set -e

for f in ./terraform/*; do
    echo "Rendering README.md for $f (recursive)"
    if [[ "$f" == *hack* ]]; then
        echo "Skipping $f"
    else
        terraform-docs markdown --recursive $f --output-file README.md
    fi
done
