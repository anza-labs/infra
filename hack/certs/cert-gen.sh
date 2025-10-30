#!/usr/bin/env bash

set -euo pipefail

# === Config ===
CERT_DIR="./certs"
CA_KEY="${CERT_DIR}/ca.key"
CA_CERT="${CERT_DIR}/ca.crt"
DAYS_VALID=365

# === Argument parsing ===
if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <IP> [FQDN1] [FQDN2] [...]"
  exit 1
fi

IP="$1"
shift
DNS_NAMES=("$@")

# === Functions ===

function generate_server_cert() {
  local ip="$1"
  shift
  local dns_list=("$@")

  local cert_path="${CERT_DIR}/${ip}"
  mkdir -p "${cert_path}"

  echo "[*] Creating OpenSSL config with SAN entries..."
  local openssl_cfg
  openssl_cfg="$(mktemp)"

  {
    echo "[ req ]"
    echo "default_bits       = 2048"
    echo "prompt             = no"
    echo "default_md         = sha256"
    echo "req_extensions     = req_ext"
    echo "distinguished_name = dn"

    echo "[ dn ]"
    echo "C = PL"
    echo "ST = Silesia"
    echo "L = Katowice"
    echo "O = anza-labs"
    echo "CN = ${ip}"

    echo "[ req_ext ]"
    echo "subjectAltName = @alt_names"

    echo "[ alt_names ]"
    echo "IP.1 = ${ip}"
    local idx=1
    for dns in "${dns_list[@]}"; do
      echo "DNS.$((idx++)) = ${dns}"
    done
  } > "${openssl_cfg}"

  echo "[*] Generating private key and CSR for ${ip}..."
  openssl genrsa -out "${cert_path}/server.key" 2048
  openssl req -new -key "${cert_path}/server.key" \
    -out "${cert_path}/server.csr" \
    -config "${openssl_cfg}"

  echo "[*] Signing certificate with root CA..."
  openssl x509 -req -in "${cert_path}/server.csr" \
    -CA "${CA_CERT}" -CAkey "${CA_KEY}" \
    -CAcreateserial -out "${cert_path}/server.crt" \
    -days "${DAYS_VALID}" -sha256 \
    -extfile "${openssl_cfg}" -extensions req_ext

  rm -f "${cert_path}/server.csr" "${openssl_cfg}"
  echo "[+] Certificate for ${ip} generated at ${cert_path}"
}

# === Main ===

generate_server_cert "${IP}" "${DNS_NAMES[@]}"
