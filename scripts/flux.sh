#!/usr/bin/env bash

set -e
set -o pipefail

X_NAME="${1:-kubernetes}"

flux bootstrap github \
    --token-auth \
    --owner=anza-labs \
    --repository=infra \
    --branch=main \
    --path="clusters/${X_NAME}" \
    --personal
