#!/usr/bin/env bash

set -euo pipefail

# === Config ===
CERT_DIR="./certs"
CA_KEY="${CERT_DIR}/ca.key"
CA_CERT="${CERT_DIR}/ca.crt"

# Ensure BWS_PROJECT_ID is set
if [[ -z "${BWS_PROJECT_ID:-}" ]]; then
  echo "ERROR: BWS_PROJECT_ID is not set!"
  exit 1
fi

# === Functions ===

function fetch_secret() {
  local name="$1"
  local output_path="$2"

  echo "[*] Checking if Bitwarden secret for ${name} exists..."
  local secret_id
  secret_id="$(bws secret list | jq -r --arg key "$name" '.[] | select(.key == $key) | .id')"

  echo "[*] Fetching Bitwarden secret for ${name}..."
  local value
  value="$(bws secret get "$secret_id" --output json | jq -r '.value')"

  if [[ -z "$value" ]]; then
    echo "ERROR: Bitwarden secret '${name}' not found or empty!"
    exit 1
  fi

  echo "$value" > "$output_path"
  echo "[+] Secret '${name}' written to '${output_path}'"
}

function load_ca() {
  echo "[*] Ensuring certificate directory exists..."
  mkdir -p "${CERT_DIR}"

  fetch_secret "ca.key" "${CA_KEY}"
  fetch_secret "ca.crt" "${CA_CERT}"
}

# === Main ===

load_ca
