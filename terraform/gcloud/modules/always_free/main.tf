resource "google_compute_instance" "vm_instance" {
  name         = var.instance_name
  machine_type = var.instance_shape
  tags         = ["kubernetes"]

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
        k3s_version     = var.k3s_version,
        discord_webhook = var.discord_webhook,
      }
    )
  }

  network_interface {
    network = "default"
    access_config {}
  }
}

resource "google_compute_firewall" "allow_k8s_api" {
  name        = "allow-k8s-api-6443"
  description = "Allows ingress TCP traffic on port 6443 for K3s API server"

  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["6443"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["kubernetes"]
}
