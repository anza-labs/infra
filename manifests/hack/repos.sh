#!/usr/bin/env bash

set -e

KUSTOMIZATION_FILE="cluster-templates/infra/repos/kustomization.yaml"
TEMP_FILE="$(mktemp)"
CHECK_MODE=false

# Ensure temp file is removed on exit
trap 'rm -f "$TEMP_FILE"' EXIT

# Parse arguments
if [ "$1" = "--check" ]; then
  CHECK_MODE=true
fi

# Generate kustomization.yaml
{
  echo "apiVersion: kustomize.config.k8s.io/v1beta1"
  echo "kind: Kustomization"
  echo "resources:"
  find cluster-templates/infra/repos \
      -maxdepth 1 \
      -type f \
      -name '*.yaml' \
      ! -name 'kustomization.yaml' |\
    sort |\
    sed 's|cluster-templates/infra/repos/||' |\
    sed 's/^/- /'
} > "${TEMP_FILE}"

# Check for differences if --check is set
if ${CHECK_MODE}; then
  if ! diff -q "${KUSTOMIZATION_FILE}" "${TEMP_FILE}" >/dev/null 2>&1; then
    echo "Changes detected in kustomization.yaml. Run the script without --check to update."
    exit 1
  fi
  exit 0
fi

# Replace existing kustomization.yaml
mv "${TEMP_FILE}" "${KUSTOMIZATION_FILE}"

echo "Updated ${KUSTOMIZATION_FILE}"
