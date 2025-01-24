data "oci_identity_availability_domain" "ad" {
  compartment_id = var.tenancy_ocid
  ad_number      = var.availability_domain
}

data "oci_core_images" "instance_images" {
  compartment_id           = var.tenancy_ocid
  operating_system         = "Ubuntu"
  operating_system_version = "24.04"
  shape                    = var.instance_shape
}

locals {
  count       = var.instance_shape == "VM.Standard.E2.1.Micro" ? 2 : 1
  ocpus       = var.instance_shape == "VM.Standard.E2.1.Micro" ? 1 : 4
  memory      = var.instance_shape == "VM.Standard.E2.1.Micro" ? 1 : 24
  boot_volume = var.instance_shape == "VM.Standard.E2.1.Micro" ? 100 : 200
}

# resource "oci_core_instance" "instance" {
#   count               = local.count
#   availability_domain = data.oci_identity_availability_domain.ad.name
#   compartment_id      = var.tenancy_ocid
#   display_name        = format("always-free-%s-${count.index}", replace(title(var.instance_name), "/\\s/", ""))
#   shape               = var.instance_shape

#   shape_config {
#     ocpus         = local.ocpus
#     memory_in_gbs = local.memory
#   }

#   create_vnic_details {
#     subnet_id                 = var.subnet_id
#     display_name              = format("%sVNIC", replace(title(var.instance_name), "/\\s/", ""))
#     assign_public_ip          = true
#     assign_private_dns_record = true
#     hostname_label            = format("%s${count.index}", lower(replace(var.instance_name, "/\\s/", "")))
#   }

#   source_details {
#     source_type             = var.instance_source_type
#     source_id               = var.instance_image_ocid[var.region]
#     boot_volume_size_in_gbs = local.boot_volume
#     boot_volume_vpus_per_gb = 10
#   }

#   metadata = {
#     ssh_authorized_keys = var.ssh_public_keys
#   }

#   timeouts {
#     create = "60m"
#   }
# }
