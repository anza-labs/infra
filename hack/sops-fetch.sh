#!/usr/bin/env bash

set -euo pipefail

# === Config ===
CERT_DIR="./certs"
SOPS_KEY="${CERT_DIR}/sops.asc"

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

function load_sops() {
  echo "[*] Ensuring certificate directory exists..."
  mkdir -p "${CERT_DIR}"

  fetch_secret "sops.asc" "${SOPS_KEY}"
}

# === Main ===

load_sops
