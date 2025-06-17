resource "tailscale_tailnet_key" "tailscale_key" {
  description         = "GCloud Always-Free VM key"
  expiry              = 3600
  reusable            = true
  preauthorized       = true
  recreate_if_invalid = "always"
  tags                = ["tag:gcloud", "tag:always-free"]
}

resource "null_resource" "triggers" {
  triggers = {
    user_data_hash         = sha256(file("${path.module}/templates/user_data.tftpl")),
    tailsacle_version_hash = sha256("${var.tailscale_version}"),
    discord_webhook_hash   = sha256("${var.discord_webhook}"),
  }
}


resource "google_compute_instance" "vm_instance" {
  name         = var.instance_name
  machine_type = var.instance_shape

  boot_disk {
    initialize_params {
      image = "cos-cloud/cos-stable"
      size  = 30
      type  = "pd-standard"
    }
  }

  metadata = {
    "user-data" = templatefile(
      "${path.module}/templates/user_data.tftpl",
      {
        tailscale_version = var.tailscale_version,
        hostname          = var.instance_name,
        discord_webhook   = var.discord_webhook,
        tailscale_key     = tailscale_tailnet_key.tailscale_key.key,
      }
    ),
    "ssh-keys" = "shared:${var.ssh_public_keys}",
  }

  network_interface {
    network = "default"
    access_config {}
  }

  lifecycle {
    replace_triggered_by = [
      null_resource.triggers,
    ]
  }
}
