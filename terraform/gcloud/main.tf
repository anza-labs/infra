provider "google" {
  project = var.project_id
  region  = var.region
  zone    = "${var.region}-${var.zone}"
}

module "gcloud_vm" {
  source = "./modules/always_free"

  instance_name  = "micro"
  instance_shape = "e2-micro"

  region = var.region
}