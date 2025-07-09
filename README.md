# Infra

<table align="center">
  <tr>
    <td align="center" colspan="2"><img src="./resources/baremetal.webp" height="32px"><br>Baremetal</a></td>
    <td align="center" colspan="2"><a href="https://oraclecloud.com" target="_blank"><img src="./resources/oraclecloud.png" height="32px"><br>Oracle Cloud</a></td>
    <td align="center" colspan="2"><a href="https://cloud.google.com" target="_blank"><img src="./resources/gcloud.png" height="32px"><br>Google Cloud</a></a></td>
  </tr>
  <tr>
    <td align="center" colspan="3"><a href="https://kubernetes.io"><img src="./resources/kubernetes.png" alt="Kubernetes" width="128px"/><br>Kubernetes</a></td>
    <td align="center" colspan="3"><a href="https://docker.com"><img src="./resources/docker.webp" alt="Kubernetes" width="128px"/><br>Docker</a></td>
  </tr>
  <tr>
    <td align="center" colspan="2"><a href="https://www.talos.dev" target="_blank"><img src="./resources/talos.png" height="32px"><br>Talos Linux</a></td>
    <td align="center" colspan="2"><a href="http://ubuntu.com" target="_blank"><img src="./resources/ubuntu.png" height="32px"><br>Ubuntu</a></td>
    <td align="center" colspan="2"><a href="https://cloud.google.com/container-optimized-os/docs" target="_blank"><img src="./resources/google-cos.png" height="32px"><br>Google COS</a></td>
  </tr>
  <tr>
    <td align="center"><a href="http://fluxcd.io" target="_blank"><img src="./resources/flux.png" height="32px"><br>FluxCD</a></td>
    <td align="center"><a href="http://prometheus.io" target="_blank"><img src="./resources/prometheus.png" height="32px"><br>Prometheus</a></td>
    <td align="center"><a href="http://opentofu.org" target="_blank"><img src="./resources/opentofu.png" height="32px"><br>OpenTofu</a></td>
    <td align="center"><a href="https://www.mend.io/renovate/" target="_blank"><img src="./resources/renovate.png" height="32px"><br>Renovate</a></td>
    <td></td>
    <td align="center"><a href="https://supabase.com" target="_blank"><img src="./resources/supabase.png" height="32px"><br>Supabase</a></td>
  </tr>
  <tr>
    <td align="center"><a href="http://perses.dev" target="_blank"><img src="./resources/perses.png" height="32px"><br>Perses</a></td>
    <td></td>
    <td align="center"><a href="http://opentelemetry.io" target="_blank"><img src="./resources/opentelemetry.png" height="32px"><br>OTel</a></td>
    <td align="center"><a href="https://tailscale.com" target="_blank"><img src="./resources/tailscale.png" height="32px"><br>Tailscale</a></td>
    <td align="center"><a href="https://cloud-init.io" target="_blank"><img src="./resources/cloud-init.png" height="32px"><br>Cloud-Init</a></td>
    <td></td>
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
