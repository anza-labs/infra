# Infra

<table align="center">
  <tr>
    <td align="center" colspan="3"><a href="https://oraclecloud.com" target="_blank"><img src="./resources/oraclecloud.png" height="32px"><br>Oracle Cloud</a></td>
    <td align="center" colspan="3"><a href="https://cloud.google.com" target="_blank"><img src="./resources/gcloud.png" height="32px"><br>Google Cloud</a></a></td>
  </tr>
  <tr>
    <td align="center" colspan="6"><img src="./resources/kubernetes.png" alt="Kubernetes" width="256px"/></td>
  </tr>
  <tr>
    <td align="center"><a href="https://tailscale.com" target="_blank"><img src="./resources/tailscale.png" height="32px"><br>Tailscale</a></td>
    <td align="center"><a href="http://opentofu.org" target="_blank"><img src="./resources/opentofu.png" height="32px"><br>OpenTofu</a></td>
    <td align="center"><a href="https://supabase.com" target="_blank"><img src="./resources/supabase.png" height="32px"><br>Supabase</a></td>
    <td align="center"><a href="https://www.mend.io/renovate/" target="_blank"><img src="./resources/renovate.png" height="32px"><br>Renovate</a></td>
    <td align="center"><a href="http://fluxcd.io" target="_blank"><img src="./resources/flux.png" height="32px"><br>FluxCD</a></td>
    <td align="center"><a href="https://www.talos.dev" target="_blank"><img src="./resources/talos.png" height="32px"><br>Talos Linux</a></td>
  </tr>
</table>

## Infrastructure as Code with GitOps using Flux, OpenTofu and Renovate

### Overview

This repository contains the infrastructure code for managing a Kubernetes cluster using GitOps principles. The deployment and configuration are orchestrated with Flux and automated updates are handled by Renovate.

### Automated Updates

Renovate is configured to automatically check for updates to dependencies. Refer to `renovate.json` for configuration details.

### License

This repository is licensed under the [The Unlicense](LICENSE). Feel free to modify and adapt it for your needs.

### Contribution

Feel free to contribute by opening issues or submitting pull requests. Your feedback and contributions are highly appreciated!
