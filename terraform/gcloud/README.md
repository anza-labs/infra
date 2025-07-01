<!-- BEGIN_TF_DOCS -->
## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_gcloud_vm"></a> [gcloud\_vm](#module\_gcloud\_vm) | ./modules/always_free | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_discord_webhook"></a> [discord\_webhook](#input\_discord\_webhook) | Discord Webhook | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | ID of project. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The region where the resources will be created. | `string` | `"us-east1"` | no |
| <a name="input_ssh_public_keys"></a> [ssh\_public\_keys](#input\_ssh\_public\_keys) | Public SSH keys to be included in the ~/.ssh/authorized\_keys file for the default user on the instance. | `string` | n/a | yes |
| <a name="input_tailscale_oauth_client_id"></a> [tailscale\_oauth\_client\_id](#input\_tailscale\_oauth\_client\_id) | OAuth Client ID for Tailscale. | `string` | n/a | yes |
| <a name="input_tailscale_oauth_secret"></a> [tailscale\_oauth\_secret](#input\_tailscale\_oauth\_secret) | OAuth Secret for Tailscale. | `string` | n/a | yes |
| <a name="input_tailscale_tailnet"></a> [tailscale\_tailnet](#input\_tailscale\_tailnet) | Tailscale Tailnet name. | `string` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | The zone where the zoned resources will be created. | `string` | `"c"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->