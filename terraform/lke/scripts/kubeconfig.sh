#!/usr/bin/env -S bash

set -eu
set -o pipefail

mkdir -p "$(dirname "$1")"

# shellcheck disable=SC2094
echo "$3" | base64 -d | sed "s/$2/-$(basename "$1")/g" > "$1"
