resource "tailscale_tailnet_key" "tailscale_key" {
  description         = "GCloud Always-Free VM key"
  expiry              = 7776000 // 90d
  ephemeral           = true
  reusable            = true
  preauthorized       = true
  recreate_if_invalid = "always"
  tags                = ["tag:gcloud", "tag:always-free"]
}

data "http" "otel_collector_config" {
  url = var.otel_collector_config_url
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
        otel_collector_version = var.otel_collector_version,
        tailscale_version      = var.tailscale_version,

        hostname              = var.instance_name,
        discord_webhook       = var.discord_webhook,
        otel_collector_config = data.http.otel_collector_config.response_body,
        tailscale_key         = tailscale_tailnet_key.tailscale_key.key,
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
