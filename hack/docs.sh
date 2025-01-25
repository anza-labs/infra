#!/usr/bin/env bash

set -e

for f in ./terraform/*; do
    echo "Rendering README.md for $f (recursive)"
    terraform-docs markdown --recursive $f --output-file README.md
done
