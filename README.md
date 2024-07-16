# Infra

<p align="center">
  <a href="http://fluxcd.io" target="_blank"><img src="./resources/flux.png" height="32px"></a>
  <a href="http://opentofu.org" target="_blank"><img src="./resources/opentofu.png" height="32px"></a>
  <a href="https://www.mend.io/renovate/" target="_blank"><img src="./resources/renovate.png" height="32px"></a>
  <a href="http://kured.dev" target="_blank"><img src="./resources/kured.png" height="32px"></a>
  <a href="https://cluster-api.sigs.k8s.io" target="_blank"><img src="./resources/capi.svg" height="32px"></a>
  <a href="https://linode.com" target="_blank"><img src="./resources/linode.png" height="32px"></a>
  <a href="https://supabase.com" target="_blank"><img src="./resources/supabase.png" height="32px"></a>
  </br><img src="./resources/kubernetes.png" alt="Kubernetes" width="256px"/></br>
  <a href="http://cilium.io" target="_blank"><img src="./resources/cilium.png" height="32px"></a>
  <a href="http://tetragon.io" target="_blank"><img src="./resources/tetragon.png" height="32px"></a>
  <a href="https://tailscale.com" target="_blank"><img src="./resources/tailscale.png" height="32px"></a>
  <a href="https://prometheus.io" target="_blank"><img src="./resources/prometheus.png" height="32px"></a>
  <a href="https://grafana.com/oss/grafana/" target="_blank"><img src="./resources/grafana.png" height="32px"></a>
</p>

## Infrastructure as Code with GitOps using Flux, OpenTofu and Renovate

### Overview

This repository contains the infrastructure code for managing a Kubernetes cluster using GitOps principles. The deployment and configuration are orchestrated with Flux and automated updates are handled by Renovate.

### Getting Started

1. Clone this repository:

    ```bash
    git clone <repository_url>
    ```

3. Create new cluster
    * Create new cluster LKE using OpenTofu:

        ```bash
        export LINODE_TOKEN='your linode token'
        tofu -chdir=./terraform/lke init -upgrade
        tofu -chdir=./terraform/lke plan
        tofu -chdir=./terraform/lke apply -var='k8s_cluster_name=<your cluster name>'
        ```

4. Set up Flux on your cluster using the provided script:

    ```bash
    export GITHUB_TOKEN='<your github token>'
    ./scripts/flux.sh '<your cluster name>'
    ```

5. Customize your cluster configuration in the `clusters` directory.

6. Apply changes to your cluster by committing and pushing to this repository.

### Automated Updates

Renovate is configured to automatically check for updates to dependencies. Refer to `renovate.json` for configuration details.

### License

This repository is licensed under the [The Unlicense](LICENSE). Feel free to modify and adapt it for your needs.

### Contribution

Feel free to contribute by opening issues or submitting pull requests. Your feedback and contributions are highly appreciated!
