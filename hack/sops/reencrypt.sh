#!/usr/bin/env bash

set -euo pipefail

find . -type f -name '*.sops.*' -exec sh -c '
  for f; do
    echo "Encrypting $f"
    base="${f%.sops.*}"             # remove .sops.<ext>
    ext="${f##*.}"                  # extension after last dot
    sops -e "$f" > "${base}.${ext}" # restore original filename
  done
' _ {} +
