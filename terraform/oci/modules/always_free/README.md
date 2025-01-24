<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_oci"></a> [oci](#provider\_oci) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [oci_core_instance.instance](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_instance) | resource |
| [oci_identity_availability_domain.ad](https://registry.terraform.io/providers/oracle/oci/latest/docs/data-sources/identity_availability_domain) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability_domain"></a> [availability\_domain](#input\_availability\_domain) | Availability Domain of the instance. | `number` | n/a | yes |
| <a name="input_instance_image_ocid"></a> [instance\_image\_ocid](#input\_instance\_image\_ocid) | n/a | `map(string)` | <pre>{<br/>  "af-johannesburg-1": "ocid1.image.oc1.af-johannesburg-1.aaaaaaaawpk7eatcjy6a3lp4533wga35766rfp4dyabzyerhnw27m4ll4iwa",<br/>  "ap-chuncheon-1": "ocid1.image.oc1.ap-chuncheon-1.aaaaaaaaaw63k27g5yzmioqmrzo2vihk7mjnljxjeiytb4n7hahavsohfucq",<br/>  "ap-hyderabad-1": "ocid1.image.oc1.ap-hyderabad-1.aaaaaaaajfxdgwaq7lr46z6fnc27oaclyf3rxdxrrv3x4yk7bvb6maej3xea",<br/>  "ap-melbourne-1": "ocid1.image.oc1.ap-melbourne-1.aaaaaaaa3j6zakbofd34ir6ky3ayaojihu5qvkuit2fglbzp77odvrmhgika",<br/>  "ap-mumbai-1": "ocid1.image.oc1.ap-mumbai-1.aaaaaaaada53tvehh57pfeasox23xxlxcjqrhk2fxhmc3avz6huykjfqqxwq",<br/>  "ap-osaka-1": "ocid1.image.oc1.ap-osaka-1.aaaaaaaaziicuckenzmkiazpwuaqtgyeho52agni3opworbsixuzzfomz3qa",<br/>  "ap-seoul-1": "ocid1.image.oc1.ap-seoul-1.aaaaaaaao6jmk62nrtw35f7htbkfku27urugcjgurq5idpfamr6ljk7lrpra",<br/>  "ap-singapore-1": "ocid1.image.oc1.ap-singapore-1.aaaaaaaakvm4n62twqrt2kdbc76a24kmzytldq5i7azqpc4ewyinztfgypfa",<br/>  "ap-sydney-1": "ocid1.image.oc1.ap-sydney-1.aaaaaaaa3fkom62qsskheycegtjzads2rxegpdto7zuo27tlvefxdxq4gelq",<br/>  "ap-tokyo-1": "ocid1.image.oc1.ap-tokyo-1.aaaaaaaagupkwu6yar4fcxrybrz763z6ndedu3syyclc2ozjimiglyhz62va",<br/>  "ca-montreal-1": "ocid1.image.oc1.ca-montreal-1.aaaaaaaar46rcejpfludqqbzgcfjzlwdbycoh6pgmzeubijjqzfoh4rtmizq",<br/>  "ca-toronto-1": "ocid1.image.oc1.ca-toronto-1.aaaaaaaazrersuxcwk5kf5zg7z4oxaiqxiosc3vqst7n3cizqtxumhmfreeq",<br/>  "eu-amsterdam-1": "ocid1.image.oc1.eu-amsterdam-1.aaaaaaaa2p57qbnlf6xyajxzrlbep6b6ce26jtq3zjtg2dwasx5kqdesp7nq",<br/>  "eu-frankfurt-1": "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaa3rxaqcvwe2vxxffm4dfivmfb3apn4inqehxgntjrx3f7p4hzk5rq",<br/>  "eu-madrid-1": "ocid1.image.oc1.eu-madrid-1.aaaaaaaaulwlk5q2rincuyvfryhkj5iznptvn4m3w7axcn7brnegrp46s4za",<br/>  "eu-marseille-1": "ocid1.image.oc1.eu-marseille-1.aaaaaaaazqrkyscu7peeuylwrkr5aro5s23tmu6z4arfmpfqpe55hjshsoja",<br/>  "eu-milan-1": "ocid1.image.oc1.eu-milan-1.aaaaaaaa76j74hh4xo4x5b5na4mhebqe5lnqzcrkiziix5nciy7jwyjymdya",<br/>  "eu-paris-1": "ocid1.image.oc1.eu-paris-1.aaaaaaaa3g5muqkgm2a6hr3tyrmnkux5twf7s4qsgobxfsk7ldfn6claryeq",<br/>  "eu-stockholm-1": "ocid1.image.oc1.eu-stockholm-1.aaaaaaaaayzdi3vjkwzou36o5zlr4dpeowp5lgao5t3nfu53naatugsg5a6q",<br/>  "eu-zurich-1": "ocid1.image.oc1.eu-zurich-1.aaaaaaaaxcbhpaloal2ffwk6aydznpkivf3sqh62uat6zvi4u6cqrdwf6ugq",<br/>  "il-jerusalem-1": "ocid1.image.oc1.il-jerusalem-1.aaaaaaaazix76rm6nzgnociioxqftckkuvyivacxvlsciqcdzg5wo75vrfva",<br/>  "me-abudhabi-1": "ocid1.image.oc1.me-abudhabi-1.aaaaaaaayzwscmu5n5erym2yhfazrnnxts4dcakldtvufmgz2lnpsslmg25q",<br/>  "me-dubai-1": "ocid1.image.oc1.me-dubai-1.aaaaaaaaehzkji4rbdxm6wn2gyub5svp4comupf6npik2mimohgl3ndzoalq",<br/>  "me-jeddah-1": "ocid1.image.oc1.me-jeddah-1.aaaaaaaafejy3dmmdmtseyulxexmdempnb7y3fnr42xy5oujzkwhbolcdgzq",<br/>  "mx-monterrey-1": "ocid1.image.oc1.mx-monterrey-1.aaaaaaaaj6z6qzntcr224i6e3ecmtdvusardx57nctte5iy7pbdxtucihfea",<br/>  "mx-queretaro-1": "ocid1.image.oc1.mx-queretaro-1.aaaaaaaa3g5kts3h44plitvang6pxowujeq4xwtt55zcjuob2yntzdqjf4xq",<br/>  "sa-bogota-1": "ocid1.image.oc1.sa-bogota-1.aaaaaaaa5yfvvsf7iihjdktj2sljttu7szoemmkvuctyyddvjdw3hry6ljla",<br/>  "sa-santiago-1": "ocid1.image.oc1.sa-santiago-1.aaaaaaaagpqnmgg3ezmwtdbjey6j266odp7o2gstxloojqbkymbxybwjxqga",<br/>  "sa-saopaulo-1": "ocid1.image.oc1.sa-saopaulo-1.aaaaaaaacu6x6mx4f3774nwl7nsvfkr7dxusin2qsop437hcdob6pmlfrhva",<br/>  "sa-valparaiso-1": "ocid1.image.oc1.sa-valparaiso-1.aaaaaaaash4gf2gftog7bxc75h64v57iwbapzbopv3h4f43myafrcldxr7fa",<br/>  "sa-vinhedo-1": "ocid1.image.oc1.sa-vinhedo-1.aaaaaaaanfvkdy5eupkutbwdbpemmckh5u34mi5noxxz6iqgqg3oqqsos7mq",<br/>  "uk-cardiff-1": "ocid1.image.oc1.uk-cardiff-1.aaaaaaaaislu6nkxyakkvcpuiyj5l73qcnqlp4jbjae52qnxgfs4sacnmdda",<br/>  "uk-london-1": "ocid1.image.oc1.uk-london-1.aaaaaaaavehem6scohtwwfpxj576isnczlujphlbnk5ynzmhra2irryqwt4q",<br/>  "us-ashburn-1": "ocid1.image.oc1.iad.aaaaaaaa2el7vv6ym4snc2gm5seaikafu3c4uwh2kuhhlsv2wpkdonjdom5a",<br/>  "us-chicago-1": "ocid1.image.oc1.us-chicago-1.aaaaaaaau6xpqfw65vt3jvrq3efz6akfhafcwr3ugxzdkvqjnvagca2fczna",<br/>  "us-phoenix-1": "ocid1.image.oc1.phx.aaaaaaaa47msfuw77sfw4eabf23tko6e6kbbbogbeuo6po6ni3lfgjkc5j2q",<br/>  "us-sanjose-1": "ocid1.image.oc1.us-sanjose-1.aaaaaaaarnyyk6idhfscm2am5mcjfoeniph2ssfqgiploplo4vtpfklmxvbq"<br/>}</pre> | no |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | Name of the instance. | `string` | n/a | yes |
| <a name="input_instance_shape"></a> [instance\_shape](#input\_instance\_shape) | Type of an instance | `string` | `"VM.Standard.E2.1.Micro"` | no |
| <a name="input_instance_source_type"></a> [instance\_source\_type](#input\_instance\_source\_type) | The source type for the instance. | `string` | `"image"` | no |
| <a name="input_region"></a> [region](#input\_region) | The oci region where resources will be created. | `string` | `"eu-frankfurt-1"` | no |
| <a name="input_ssh_public_keys"></a> [ssh\_public\_keys](#input\_ssh\_public\_keys) | Public SSH keys to be included in the ~/.ssh/authorized\_keys file for the default user on the instance. | `string` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Name of the instance. | `string` | n/a | yes |
| <a name="input_tenancy_ocid"></a> [tenancy\_ocid](#input\_tenancy\_ocid) | Tenancy ocid where to create the sources. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->