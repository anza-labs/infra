<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.8 |
| <a name="requirement_oci"></a> [oci](#requirement\_oci) | 6.23.0 |

## Providers

No providers.

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
| <a name="input_private_key"></a> [private\_key](#input\_private\_key) | Contents of OCI API Private Key used. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The oci region where resources will be created. | `string` | `"eu-frankfurt-1"` | no |
| <a name="input_ssh_public_keys"></a> [ssh\_public\_keys](#input\_ssh\_public\_keys) | Public SSH keys to be included in the ~/.ssh/authorized\_keys file for the default user on the instance. | `string` | n/a | yes |
| <a name="input_tenancy_ocid"></a> [tenancy\_ocid](#input\_tenancy\_ocid) | Tenancy ocid where to create the sources. | `string` | n/a | yes |
| <a name="input_user_ocid"></a> [user\_ocid](#input\_user\_ocid) | Ocid of user that terraform will use to create the resources. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->