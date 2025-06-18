<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |
| <a name="provider_null"></a> [null](#provider\_null) | n/a |
| <a name="provider_tailscale"></a> [tailscale](#provider\_tailscale) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_instance.vm_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance) | resource |
| [null_resource.triggers](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [tailscale_tailnet_key.tailscale_key](https://registry.terraform.io/providers/tailscale/tailscale/latest/docs/resources/tailnet_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_discord_webhook"></a> [discord\_webhook](#input\_discord\_webhook) | Discord Webhook | `string` | n/a | yes |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | Name of the instance. | `string` | n/a | yes |
| <a name="input_instance_shape"></a> [instance\_shape](#input\_instance\_shape) | Type of an instance | `string` | `"e2-micro"` | no |
| <a name="input_region"></a> [region](#input\_region) | The region where the instance will be created. | `string` | `"us-east1"` | no |
| <a name="input_ssh_public_keys"></a> [ssh\_public\_keys](#input\_ssh\_public\_keys) | Public SSH keys to be included in the ~/.ssh/authorized\_keys file for the default user on the instance. | `string` | n/a | yes |
| <a name="input_tailscale_oauth_client_id"></a> [tailscale\_oauth\_client\_id](#input\_tailscale\_oauth\_client\_id) | OAuth Client ID for Tailscale. | `string` | n/a | yes |
| <a name="input_tailscale_oauth_secret"></a> [tailscale\_oauth\_secret](#input\_tailscale\_oauth\_secret) | OAuth Secret for Tailscale. | `string` | n/a | yes |
| <a name="input_tailscale_tailnet"></a> [tailscale\_tailnet](#input\_tailscale\_tailnet) | Tailscale Tailnet name. | `string` | n/a | yes |
| <a name="input_tailscale_version"></a> [tailscale\_version](#input\_tailscale\_version) | Tailscale Version | `string` | `"v1.84.2"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->