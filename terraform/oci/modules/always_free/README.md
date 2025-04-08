<!-- BEGIN_TF_DOCS -->
## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [oci_core_instance.instance](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_instance) | resource |
| [tailscale_tailnet_key.tailscale_key](https://registry.terraform.io/providers/tailscale/tailscale/latest/docs/resources/tailnet_key) | resource |
| [oci_core_images.instance_images](https://registry.terraform.io/providers/oracle/oci/latest/docs/data-sources/core_images) | data source |
| [oci_identity_availability_domain.ad](https://registry.terraform.io/providers/oracle/oci/latest/docs/data-sources/identity_availability_domain) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability_domain"></a> [availability\_domain](#input\_availability\_domain) | Availability Domain of the instance. | `number` | n/a | yes |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | Name of the instance. | `string` | n/a | yes |
| <a name="input_instance_shape"></a> [instance\_shape](#input\_instance\_shape) | Type of an instance | `string` | `"VM.Standard.E2.1.Micro"` | no |
| <a name="input_instance_source_type"></a> [instance\_source\_type](#input\_instance\_source\_type) | The source type for the instance. | `string` | `"image"` | no |
| <a name="input_region"></a> [region](#input\_region) | The oci region where resources will be created. | `string` | `"eu-frankfurt-1"` | no |
| <a name="input_source_id"></a> [source\_id](#input\_source\_id) | The source ID of the instance. | `string` | `null` | no |
| <a name="input_ssh_public_keys"></a> [ssh\_public\_keys](#input\_ssh\_public\_keys) | Public SSH keys to be included in the ~/.ssh/authorized\_keys file for the default user on the instance. | `string` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Name of the instance. | `string` | n/a | yes |
| <a name="input_tailscale_oauth_client_id"></a> [tailscale\_oauth\_client\_id](#input\_tailscale\_oauth\_client\_id) | OAuth Client ID for Tailscale. | `string` | n/a | yes |
| <a name="input_tailscale_oauth_secret"></a> [tailscale\_oauth\_secret](#input\_tailscale\_oauth\_secret) | OAuth Secret for Tailscale. | `string` | n/a | yes |
| <a name="input_tailscale_tailnet"></a> [tailscale\_tailnet](#input\_tailscale\_tailnet) | Tailscale Tailnet name. | `string` | n/a | yes |
| <a name="input_tenancy_ocid"></a> [tenancy\_ocid](#input\_tenancy\_ocid) | Tenancy ocid where to create the sources. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->