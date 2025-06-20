<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.8 |
| <a name="requirement_docker"></a> [docker](#requirement\_docker) | 3.6.2 |
| <a name="requirement_flux"></a> [flux](#requirement\_flux) | 1.6.2 |
| <a name="requirement_kind"></a> [kind](#requirement\_kind) | 0.9.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.37.1 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_local"></a> [local](#module\_local) | ./modules/local | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bitwarden_token"></a> [bitwarden\_token](#input\_bitwarden\_token) | n/a | `string` | n/a | yes |
| <a name="input_discord_webhook"></a> [discord\_webhook](#input\_discord\_webhook) | n/a | `string` | n/a | yes |
| <a name="input_docker_socket"></a> [docker\_socket](#input\_docker\_socket) | n/a | `string` | `"unix:///var/run/docker.sock"` | no |
| <a name="input_github_token"></a> [github\_token](#input\_github\_token) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kubeconfig"></a> [kubeconfig](#output\_kubeconfig) | n/a |
<!-- END_TF_DOCS -->