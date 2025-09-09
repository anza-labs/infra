#!/usr/bin/env bash

set -euo pipefail

# === Config ===
CERT_DIR="./certs"
SOPS_KEY="${CERT_DIR}/sops.asc"
KEY_NAME="sops.anza-labs.dev"
KEY_COMMENT="flux secrets"

# Ensure BWS_PROJECT_ID is set
if [[ -z "${BWS_PROJECT_ID:-}" ]]; then
  echo "ERROR: BWS_PROJECT_ID is not set!"
  exit 1
fi

# === Functions ===

function generate_key() {
  echo "[*] Ensuring temp dir..."
  mkdir -p "${CERT_DIR}"

  echo "[*] Generating new SOPS key..."
  gpg --batch --full-generate-key <<EOF
%no-protection
Key-Type: 1
Key-Length: 4096
Subkey-Type: 1
Subkey-Length: 4096
Expire-Date: 0
Name-Comment: ${KEY_COMMENT}
Name-Real: ${KEY_NAME}
EOF

  echo "[*] Exporting new SOPS key..."
  KEY_FP=$(gpg --list-secret-keys "${KEY_NAME}" | awk '/^sec/{getline; print $1}')
  gpg --export-secret-keys --armor "${KEY_FP}" > "${SOPS_KEY}"

  echo "[+] SOPS key generation complete: ${SOPS_KEY}"
}

function store_secret() {
  local name="$1"
  local file="$2"

  echo "[*] Checking if Bitwarden secret for ${name} exists..."
  local secret_id
  secret_id="$(bws secret list | jq -r --arg key "$name" '.[] | select(.key == $key) | .id')"

  if [[ -z "$secret_id" ]]; then
    echo "[*] Creating new Bitwarden secret: $name"
    bws secret create "$name" -- "$(cat "$file")" "${BWS_PROJECT_ID}"
  else
    echo "[*] Updating existing Bitwarden secret: $name"
    bws secret edit \
      --key="$name" \
      --value="$(cat "$file")" \
      --project-id="${BWS_PROJECT_ID}" \
      "$secret_id"
  fi
}

# === Main ===

generate_key
store_secret "sops.asc" "${SOPS_KEY}"
