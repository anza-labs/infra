#!/usr/bin/env bash

set -euo pipefail

FILE="$1"

if [[ "$FILE" == *.* ]]; then
    OUTPUT="${FILE%.*}.sops.${FILE##*.}"
else
    OUTPUT="${FILE}.sops"
fi

sops -d "$FILE" > "$OUTPUT"
