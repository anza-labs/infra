#!/usr/bin/env bash

set -euo pipefail

export FILE="${1}"

sops -d "${FILE}" > "${FILE%.yaml}.sops.yaml"
