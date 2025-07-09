#!/usr/bin/env bash

set -e

export GIT_SHA="$(git rev-parse HEAD)"

declare -A clusters
clusters[homelab]="talos"

for CLUSTER in "${!clusters[@]}"; do
  export CLUSTER
  mkdir -p "./flux/manifests/${CLUSTER}"
  kustomize build "./flux/cluster-templates/${clusters[$CLUSTER]}/apps" |\
    envsubst > "./flux/manifests/${CLUSTER}/flux-apps.yaml"
done
