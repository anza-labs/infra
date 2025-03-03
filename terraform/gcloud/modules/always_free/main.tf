resource "google_compute_instance" "vm_instance" {
  name         = "small-vm-instance"
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      size  = 30
      type  = "pd-standard"
    }
  }

  network_interface {
    network = "default"
  }
}
