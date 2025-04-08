<!-- BEGIN_TF_DOCS -->
## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_instance.vm_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | Name of the instance. | `string` | n/a | yes |
| <a name="input_instance_shape"></a> [instance\_shape](#input\_instance\_shape) | Type of an instance | `string` | `"e2-micro"` | no |
| <a name="input_region"></a> [region](#input\_region) | The region where the instance will be created. | `string` | `"us-east1"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->