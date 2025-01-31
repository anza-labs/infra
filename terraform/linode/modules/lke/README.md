<!-- BEGIN_TF_DOCS -->
## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [flux_bootstrap_git.flux](https://registry.terraform.io/providers/fluxcd/flux/latest/docs/resources/bootstrap_git) | resource |
| [kubernetes_secret.bitwarden](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |
| [kubernetes_secret.discord_webhook](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |
| [linode_lke_cluster.lke](https://registry.terraform.io/providers/linode/linode/latest/docs/resources/lke_cluster) | resource |
| [kubernetes_nodes.nodes](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/data-sources/nodes) | data source |
| [linode_lke_versions.lke](https://registry.terraform.io/providers/linode/linode/latest/docs/data-sources/lke_versions) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bitwarden_token"></a> [bitwarden\_token](#input\_bitwarden\_token) | n/a | `string` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `string` | n/a | yes |
| <a name="input_discord_webhook"></a> [discord\_webhook](#input\_discord\_webhook) | n/a | `string` | n/a | yes |
| <a name="input_flux"></a> [flux](#input\_flux) | n/a | `bool` | `false` | no |
| <a name="input_github_repo"></a> [github\_repo](#input\_github\_repo) | n/a | `string` | n/a | yes |
| <a name="input_github_token"></a> [github\_token](#input\_github\_token) | n/a | `string` | n/a | yes |
| <a name="input_k8s_version"></a> [k8s\_version](#input\_k8s\_version) | n/a | `string` | n/a | yes |
| <a name="input_node_pools"></a> [node\_pools](#input\_node\_pools) | n/a | <pre>list(object({<br/>    type  = string<br/>    count = number<br/>  }))</pre> | <pre>[<br/>  {<br/>    "count": 3,<br/>    "type": "g6-standard-2"<br/>  }<br/>]</pre> | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `"eu-central"` | no |
| <a name="input_root"></a> [root](#input\_root) | n/a | `string` | `"."` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kubeconfig"></a> [kubeconfig](#output\_kubeconfig) | n/a |
<!-- END_TF_DOCS -->