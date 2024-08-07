#!/usr/bin/env bash

set -e
set -o pipefail

X_NAME="${1:-kubernetes}"
BW_TOKEN="${2}"

kubectl create secret generic bitwarden \
    --namespace=kube-system \
    --from-literal=token="${BW_TOKEN}"

flux bootstrap github \
    --token-auth \
    --owner=anza-labs \
    --repository=infra \
    --branch=main \
    --path="clusters/${X_NAME}" \
    --personal
