data "oci_identity_availability_domain" "ad" {
  compartment_id = var.tenancy_ocid
  ad_number      = var.availability_domain
}

data "oci_core_images" "instance_images" {
  compartment_id           = var.tenancy_ocid
  operating_system         = "Canonical Ubuntu"
  operating_system_version = "24.04"
  shape                    = var.instance_shape
  state                    = "AVAILABLE"
  sort_order               = "DESC"
  sort_by                  = "TIMECREATED"
}

locals {
  count       = var.instance_shape == "VM.Standard.E2.1.Micro" ? 2 : 1
  ocpus       = var.instance_shape == "VM.Standard.E2.1.Micro" ? 1 : 4
  memory      = var.instance_shape == "VM.Standard.E2.1.Micro" ? 1 : 24
  boot_volume = var.instance_shape == "VM.Standard.E2.1.Micro" ? 100 : 200
}

resource "tailscale_tailnet_key" "tailscale_key" {
  description         = "OCI Always-Free VM key"
  expiry              = 7776000 // 90d
  ephemeral           = true
  reusable            = true
  preauthorized       = true
  recreate_if_invalid = "always"
  tags                = ["tag:oci", "tag:always-free"]
}

data "http" "otel_collector_config" {
  url = var.otel_collector_config_url
}

data "http" "registry_config" {
  url = var.registry_config_url
}

resource "null_resource" "triggers" {
  depends_on = [
    data.http.otel_collector_config,
  ]

  triggers = {
    discord_webhook_hash        = sha256("${var.discord_webhook}"),
    otel_collector_config_hash  = sha256("${data.http.otel_collector_config.response_body}"),
    otel_collector_version_hash = sha256("${var.otel_collector_version}"),
    tailscale_key_hash          = sha256("${tailscale_tailnet_key.tailscale_key.key}")
    tailsacle_version_hash      = sha256("${var.tailscale_version}"),
    user_data_hash              = sha256(file("${path.module}/templates/user_data.tftpl")),
  }
}

resource "oci_core_instance" "instance" {
  count               = local.count
  availability_domain = data.oci_identity_availability_domain.ad.name
  compartment_id      = var.tenancy_ocid
  display_name        = format("always-free-%s-${count.index}", replace(title(var.instance_name), "/\\s/", ""))
  shape               = var.instance_shape

  shape_config {
    ocpus         = local.ocpus
    memory_in_gbs = local.memory
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
    source_id               = data.oci_core_images.instance_images.images[0].id
    boot_volume_size_in_gbs = local.boot_volume
    boot_volume_vpus_per_gb = 10
  }

  metadata = {
    ssh_authorized_keys = var.ssh_public_keys
    user_data = base64encode(templatefile(
      "${path.module}/templates/user_data.tftpl",
      {
        otel_collector_version = var.otel_collector_version,
        tailscale_version      = var.tailscale_version,
        registry_version       = var.registry_version,

        hostname              = format("%s${count.index}", lower(replace(var.instance_name, "/\\s/", ""))),
        discord_webhook       = var.discord_webhook,
        otel_collector_config = data.http.otel_collector_config.response_body,
        registry_config       = data.http.registry_config.response_body,
        registry_env          = "", // TODO
        tailscale_key         = tailscale_tailnet_key.tailscale_key.key,
      }
    ))
  }

  timeouts {
    create = "60m"
  }

  lifecycle {
    create_before_destroy = false

    ignore_changes = [
      metadata["user_data"],
      source_details[0].source_id,
    ]

    replace_triggered_by = [
      null_resource.triggers,
    ]
  }
}
