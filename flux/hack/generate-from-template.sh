#!/usr/bin/env bash

set -e

WORKLOAD=("eu-1")
export GIT_SHA="$(git rev-parse HEAD)"

# Generate infra apps
kustomize build ./cluster-templates/infra/apps |\
  envsubst > manifests/eu-1-infra/flux-apps.yaml

# Generate workload apps for each cluster
for CLUSTER in "${WORKLOAD[@]}"; do
  export CLUSTER
  kustomize build ./cluster-templates/workload/apps |\
    envsubst > "manifests/${CLUSTER}/flux-apps.yaml"
done
