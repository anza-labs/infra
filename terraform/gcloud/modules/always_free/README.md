<!-- BEGIN_TF_DOCS -->
## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_instance.vm_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance) | resource |
| [null_resource.triggers](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [tailscale_tailnet_key.tailscale_key](https://registry.terraform.io/providers/tailscale/tailscale/latest/docs/resources/tailnet_key) | resource |
| [http_http.otel_collector_config](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_discord_webhook"></a> [discord\_webhook](#input\_discord\_webhook) | Discord Webhook | `string` | n/a | yes |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | Name of the instance. | `string` | n/a | yes |
| <a name="input_instance_shape"></a> [instance\_shape](#input\_instance\_shape) | Type of an instance | `string` | `"e2-micro"` | no |
| <a name="input_otel_collector_config_url"></a> [otel\_collector\_config\_url](#input\_otel\_collector\_config\_url) | OTel Collector config URL | `string` | n/a | yes |
| <a name="input_otel_collector_version"></a> [otel\_collector\_version](#input\_otel\_collector\_version) | OTel Collector Version | `string` | `"0.128.0"` | no |
| <a name="input_region"></a> [region](#input\_region) | The region where the instance will be created. | `string` | `"us-east1"` | no |
| <a name="input_ssh_public_keys"></a> [ssh\_public\_keys](#input\_ssh\_public\_keys) | Public SSH keys to be included in the ~/.ssh/authorized\_keys file for the default user on the instance. | `string` | n/a | yes |
| <a name="input_tailscale_oauth_client_id"></a> [tailscale\_oauth\_client\_id](#input\_tailscale\_oauth\_client\_id) | OAuth Client ID for Tailscale. | `string` | n/a | yes |
| <a name="input_tailscale_oauth_secret"></a> [tailscale\_oauth\_secret](#input\_tailscale\_oauth\_secret) | OAuth Secret for Tailscale. | `string` | n/a | yes |
| <a name="input_tailscale_tailnet"></a> [tailscale\_tailnet](#input\_tailscale\_tailnet) | Tailscale Tailnet name. | `string` | n/a | yes |
| <a name="input_tailscale_version"></a> [tailscale\_version](#input\_tailscale\_version) | Tailscale Version | `string` | `"v1.84.3"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->