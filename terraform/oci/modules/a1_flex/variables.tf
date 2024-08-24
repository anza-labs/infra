variable "tenancy_ocid" {
  type        = string
  description = "Tenancy ocid where to create the sources."
}

variable "instance_name" {
  type        = string
  description = "Name of the instance."
}

variable "subnet_id" {
  type        = string
  description = "Name of the instance."
}

variable "availability_domain" {
  type        = number
  description = "Availability Domain of the instance."
}

variable "region" {
  type        = string
  description = "The oci region where resources will be created."
  default     = "eu-frankfurt-1"
}

variable "ssh_public_keys" {
  type        = string
  description = "Public SSH keys to be included in the ~/.ssh/authorized_keys file for the default user on the instance."
}

variable "instance_source_type" {
  type        = string
  description = "The source type for the instance."
  default     = "image"
}

variable "instance_image_ocid" {
  type = map(string)

  # See https://docs.us-phoenix-1.oraclecloud.com/images/
  default = {
    af-johannesburg-1 = "ocid1.image.oc1.af-johannesburg-1.aaaaaaaawpk7eatcjy6a3lp4533wga35766rfp4dyabzyerhnw27m4ll4iwa"
    ap-chuncheon-1    = "ocid1.image.oc1.ap-chuncheon-1.aaaaaaaaaw63k27g5yzmioqmrzo2vihk7mjnljxjeiytb4n7hahavsohfucq"
    ap-hyderabad-1    = "ocid1.image.oc1.ap-hyderabad-1.aaaaaaaajfxdgwaq7lr46z6fnc27oaclyf3rxdxrrv3x4yk7bvb6maej3xea"
    ap-melbourne-1    = "ocid1.image.oc1.ap-melbourne-1.aaaaaaaa3j6zakbofd34ir6ky3ayaojihu5qvkuit2fglbzp77odvrmhgika"
    ap-mumbai-1       = "ocid1.image.oc1.ap-mumbai-1.aaaaaaaada53tvehh57pfeasox23xxlxcjqrhk2fxhmc3avz6huykjfqqxwq"
    ap-osaka-1        = "ocid1.image.oc1.ap-osaka-1.aaaaaaaaziicuckenzmkiazpwuaqtgyeho52agni3opworbsixuzzfomz3qa"
    ap-seoul-1        = "ocid1.image.oc1.ap-seoul-1.aaaaaaaao6jmk62nrtw35f7htbkfku27urugcjgurq5idpfamr6ljk7lrpra"
    ap-singapore-1    = "ocid1.image.oc1.ap-singapore-1.aaaaaaaakvm4n62twqrt2kdbc76a24kmzytldq5i7azqpc4ewyinztfgypfa"
    ap-sydney-1       = "ocid1.image.oc1.ap-sydney-1.aaaaaaaa3fkom62qsskheycegtjzads2rxegpdto7zuo27tlvefxdxq4gelq"
    ap-tokyo-1        = "ocid1.image.oc1.ap-tokyo-1.aaaaaaaagupkwu6yar4fcxrybrz763z6ndedu3syyclc2ozjimiglyhz62va"
    ca-montreal-1     = "ocid1.image.oc1.ca-montreal-1.aaaaaaaar46rcejpfludqqbzgcfjzlwdbycoh6pgmzeubijjqzfoh4rtmizq"
    ca-toronto-1      = "ocid1.image.oc1.ca-toronto-1.aaaaaaaazrersuxcwk5kf5zg7z4oxaiqxiosc3vqst7n3cizqtxumhmfreeq"
    eu-amsterdam-1    = "ocid1.image.oc1.eu-amsterdam-1.aaaaaaaa2p57qbnlf6xyajxzrlbep6b6ce26jtq3zjtg2dwasx5kqdesp7nq"
    eu-frankfurt-1    = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaa3rxaqcvwe2vxxffm4dfivmfb3apn4inqehxgntjrx3f7p4hzk5rq"
    eu-madrid-1       = "ocid1.image.oc1.eu-madrid-1.aaaaaaaaulwlk5q2rincuyvfryhkj5iznptvn4m3w7axcn7brnegrp46s4za"
    eu-marseille-1    = "ocid1.image.oc1.eu-marseille-1.aaaaaaaazqrkyscu7peeuylwrkr5aro5s23tmu6z4arfmpfqpe55hjshsoja"
    eu-milan-1        = "ocid1.image.oc1.eu-milan-1.aaaaaaaa76j74hh4xo4x5b5na4mhebqe5lnqzcrkiziix5nciy7jwyjymdya"
    eu-paris-1        = "ocid1.image.oc1.eu-paris-1.aaaaaaaa3g5muqkgm2a6hr3tyrmnkux5twf7s4qsgobxfsk7ldfn6claryeq"
    eu-stockholm-1    = "ocid1.image.oc1.eu-stockholm-1.aaaaaaaaayzdi3vjkwzou36o5zlr4dpeowp5lgao5t3nfu53naatugsg5a6q"
    eu-zurich-1       = "ocid1.image.oc1.eu-zurich-1.aaaaaaaaxcbhpaloal2ffwk6aydznpkivf3sqh62uat6zvi4u6cqrdwf6ugq"
    il-jerusalem-1    = "ocid1.image.oc1.il-jerusalem-1.aaaaaaaazix76rm6nzgnociioxqftckkuvyivacxvlsciqcdzg5wo75vrfva"
    me-abudhabi-1     = "ocid1.image.oc1.me-abudhabi-1.aaaaaaaayzwscmu5n5erym2yhfazrnnxts4dcakldtvufmgz2lnpsslmg25q"
    me-dubai-1        = "ocid1.image.oc1.me-dubai-1.aaaaaaaaehzkji4rbdxm6wn2gyub5svp4comupf6npik2mimohgl3ndzoalq"
    me-jeddah-1       = "ocid1.image.oc1.me-jeddah-1.aaaaaaaafejy3dmmdmtseyulxexmdempnb7y3fnr42xy5oujzkwhbolcdgzq"
    mx-monterrey-1    = "ocid1.image.oc1.mx-monterrey-1.aaaaaaaaj6z6qzntcr224i6e3ecmtdvusardx57nctte5iy7pbdxtucihfea"
    mx-queretaro-1    = "ocid1.image.oc1.mx-queretaro-1.aaaaaaaa3g5kts3h44plitvang6pxowujeq4xwtt55zcjuob2yntzdqjf4xq"
    sa-bogota-1       = "ocid1.image.oc1.sa-bogota-1.aaaaaaaa5yfvvsf7iihjdktj2sljttu7szoemmkvuctyyddvjdw3hry6ljla"
    sa-santiago-1     = "ocid1.image.oc1.sa-santiago-1.aaaaaaaagpqnmgg3ezmwtdbjey6j266odp7o2gstxloojqbkymbxybwjxqga"
    sa-saopaulo-1     = "ocid1.image.oc1.sa-saopaulo-1.aaaaaaaacu6x6mx4f3774nwl7nsvfkr7dxusin2qsop437hcdob6pmlfrhva"
    sa-valparaiso-1   = "ocid1.image.oc1.sa-valparaiso-1.aaaaaaaash4gf2gftog7bxc75h64v57iwbapzbopv3h4f43myafrcldxr7fa"
    sa-vinhedo-1      = "ocid1.image.oc1.sa-vinhedo-1.aaaaaaaanfvkdy5eupkutbwdbpemmckh5u34mi5noxxz6iqgqg3oqqsos7mq"
    uk-cardiff-1      = "ocid1.image.oc1.uk-cardiff-1.aaaaaaaaislu6nkxyakkvcpuiyj5l73qcnqlp4jbjae52qnxgfs4sacnmdda"
    uk-london-1       = "ocid1.image.oc1.uk-london-1.aaaaaaaavehem6scohtwwfpxj576isnczlujphlbnk5ynzmhra2irryqwt4q"
    us-ashburn-1      = "ocid1.image.oc1.iad.aaaaaaaa2el7vv6ym4snc2gm5seaikafu3c4uwh2kuhhlsv2wpkdonjdom5a"
    us-chicago-1      = "ocid1.image.oc1.us-chicago-1.aaaaaaaau6xpqfw65vt3jvrq3efz6akfhafcwr3ugxzdkvqjnvagca2fczna"
    us-phoenix-1      = "ocid1.image.oc1.phx.aaaaaaaa47msfuw77sfw4eabf23tko6e6kbbbogbeuo6po6ni3lfgjkc5j2q"
    us-sanjose-1      = "ocid1.image.oc1.us-sanjose-1.aaaaaaaarnyyk6idhfscm2am5mcjfoeniph2ssfqgiploplo4vtpfklmxvbq"
  }
}
