<!-- BEGIN_TF_DOCS -->
## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_oci_amd"></a> [oci\_amd](#module\_oci\_amd) | ./modules/always_free | n/a |
| <a name="module_oci_core"></a> [oci\_core](#module\_oci\_core) | ./modules/core | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability_domain"></a> [availability\_domain](#input\_availability\_domain) | Availability Domain of the instance. | `number` | `3` | no |
| <a name="input_fingerprint"></a> [fingerprint](#input\_fingerprint) | Fingerprint of OCI API Private Key. | `string` | n/a | yes |
| <a name="input_instance_source_id"></a> [instance\_source\_id](#input\_instance\_source\_id) | The source ID of the instance. | `string` | `null` | no |
| <a name="input_private_key"></a> [private\_key](#input\_private\_key) | Contents of OCI API Private Key used. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The oci region where resources will be created. | `string` | `"eu-frankfurt-1"` | no |
| <a name="input_ssh_public_keys"></a> [ssh\_public\_keys](#input\_ssh\_public\_keys) | Public SSH keys to be included in the ~/.ssh/authorized\_keys file for the default user on the instance. | `string` | n/a | yes |
| <a name="input_tailscale_oauth_client_id"></a> [tailscale\_oauth\_client\_id](#input\_tailscale\_oauth\_client\_id) | OAuth Client ID for Tailscale. | `string` | n/a | yes |
| <a name="input_tailscale_oauth_secret"></a> [tailscale\_oauth\_secret](#input\_tailscale\_oauth\_secret) | OAuth Secret for Tailscale. | `string` | n/a | yes |
| <a name="input_tailscale_tailnet"></a> [tailscale\_tailnet](#input\_tailscale\_tailnet) | Tailscale Tailnet name. | `string` | n/a | yes |
| <a name="input_tenancy_ocid"></a> [tenancy\_ocid](#input\_tenancy\_ocid) | Tenancy ocid where to create the sources. | `string` | n/a | yes |
| <a name="input_user_ocid"></a> [user\_ocid](#input\_user\_ocid) | Ocid of user that terraform will use to create the resources. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->