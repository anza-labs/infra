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
        k2d_secret = var.k2d_secret
      }
    )
  }

  network_interface {
    network = "default"
  }
}
