<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.8 |
| <a name="requirement_google"></a> [google](#requirement\_google) | 6.39.0 |

## Providers

No providers.

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
| <a name="input_zone"></a> [zone](#input\_zone) | The zone where the zoned resources will be created. | `string` | `"c"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->