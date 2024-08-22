provider "oci" {
  tenancy_ocid = var.tenancy_ocid
  user_ocid    = var.user_ocid
  fingerprint  = var.fingerprint
  private_key  = var.private_key
  region       = var.region
}

data "oci_core_instance_devices" "a1_flex_instance_devices" {
  count       = 1
  instance_id = oci_core_instance.a1_flex_instance[count.index].id
}

data "oci_identity_availability_domain" "ad" {
  compartment_id = var.tenancy_ocid
  ad_number      = var.availability_domain
}

resource "oci_core_instance" "a1_flex_instance" {
  count               = 1
  availability_domain = data.oci_identity_availability_domain.ad.name
  compartment_id      = var.tenancy_ocid
  display_name        = format("a1-flex-%s${count.index}", replace(title(var.instance_name), "/\\s/", ""))
  shape               = "VM.Standard.A1.Flex"

  shape_config {
    ocpus         = 4
    memory_in_gbs = 24
  }

  create_vnic_details {
    subnet_id                 = var.subnet_id
    display_name              = format("%sVNIC", replace(title(var.instance_name), "/\\s/", ""))
    assign_public_ip          = true
    assign_private_dns_record = true
    hostname_label            = format("%s${count.index}", lower(replace(var.instance_name, "/\\s/", "")))
  }

  source_details {
    source_type             = var.instance_source_type
    source_id               = var.instance_image_ocid[var.region]
    boot_volume_size_in_gbs = 200
  }

  metadata = {
    ssh_authorized_keys = var.ssh_public_keys
  }

  timeouts {
    create = "60m"
  }
}
