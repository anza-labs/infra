#!/usr/bin/env bash

set -e

export GIT_SHA="$(git rev-parse HEAD)"

declare -A clusters
clusters[rpi5]="k3s"

for CLUSTER in "${!clusters[@]}"; do
  export CLUSTER
  mkdir -p "manifests/${CLUSTER}"
  kustomize build "./cluster-templates/${clusters[$CLUSTER]}/apps" |\
    envsubst > "manifests/${CLUSTER}/flux-apps.yaml"
done
