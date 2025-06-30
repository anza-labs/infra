#!/usr/bin/env bash

set -euo pipefail

# === Config ===
CERT_DIR="./certs"
CA_KEY="${CERT_DIR}/ca.key"
CA_CERT="${CERT_DIR}/ca.crt"
DAYS_VALID=3650
CA_SUBJECT="/C=PL/ST=Silesia/L=Katowice/O=anza-labs/CN=anza-labs-root-ca"

# Ensure BWS_PROJECT_ID is set
if [[ -z "${BWS_PROJECT_ID:-}" ]]; then
  echo "ERROR: BWS_PROJECT_ID is not set!"
  exit 1
fi

# === Functions ===

function generate_ca() {
  echo "[*] Ensuring temp dir..."
  mkdir -p "${CERT_DIR}"

  echo "[*] Generating new CA private key..."
  openssl genrsa -out "${CA_KEY}" 4096

  echo "[*] Generating self-signed CA certificate..."
  openssl req -x509 -new -nodes -key "${CA_KEY}" \
    -sha256 -days "${DAYS_VALID}" -out "${CA_CERT}" \
    -subj "${CA_SUBJECT}"

  echo "[+] CA generation complete: ${CA_CERT}, ${CA_KEY}"
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

generate_ca
store_secret "ca.crt" "${CA_CERT}"
store_secret "ca.key" "${CA_KEY}"
