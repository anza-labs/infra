#!/usr/bin/env bash

set -e

WORKLOAD=()
export GIT_SHA="$(git rev-parse HEAD)"

# Generate infra apps
kustomize build ./cluster-templates/infra/apps |\
  envsubst > clusters/eu-1-infra/apps/flux-apps.yaml

# Generate workload apps for each cluster
for CLUSTER in "${WORKLOAD[@]}"; do
  export CLUSTER
  kustomize build ./cluster-templates/workload/apps |\
    envsubst > "clusters/eu-1-infra/workload/${CLUSTER}/apps/flux-apps.yaml"
done
