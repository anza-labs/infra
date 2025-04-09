resource "linode_object_storage_bucket" "storage" {
  region = var.region
  label  = var.name
}

resource "linode_object_storage_key" "credentials" {
  label = var.name

  bucket_access {
    bucket_name = linode_object_storage_bucket.storage.bucket_name
    region      = var.region
    permissions = "read_write"
  }
}

resource "bitwarden_secret" "access_key" {
  key        = "${var.name} @ ${var.region} (Access Key)"
  value      = linode_object_storage_key.credentials.access_key
  project_id = var.project_id
  note       = "Access Key for ${var.name} provisioned in ${var.region}"
}

resource "bitwarden_secret" "secret_key" {
  key        = "${var.name} @ ${var.region} (Secret Key)"
  value      = linode_object_storage_key.credentials.secret_key
  project_id = var.project_id
  note       = "Secret Key for ${var.name} provisioned in ${var.region}"
}
