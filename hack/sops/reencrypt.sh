#!/usr/bin/env bash

set -euo pipefail

find . -type f -name '*.sops.yaml' -exec sh -c 'for f; do echo "$f"; sops -e "$f" > "${f%.sops.yaml}.yaml"; done' _ {} +
