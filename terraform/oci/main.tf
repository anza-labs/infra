provider "oci" {
  tenancy_ocid = var.tenancy_ocid
  user_ocid    = var.user_ocid
  fingerprint  = var.fingerprint
  private_key  = var.private_key
  region       = var.region
}

module "oci_core" {
  source = "./modules/core"

  name = "core"

  tenancy_ocid        = var.tenancy_ocid
  availability_domain = var.availability_domain
}

module "oci_amd" {
  source = "./modules/always_free"

  instance_name  = "amd"
  instance_shape = "VM.Standard.E2.1.Micro"
  subnet_id      = module.oci_core.subnet_id
  recreate       = "never"

  source_id                 = var.instance_source_id
  tenancy_ocid              = var.tenancy_ocid
  ssh_public_keys           = var.ssh_public_keys
  availability_domain       = var.availability_domain
  tailscale_oauth_client_id = var.tailscale_oauth_client_id
  tailscale_oauth_secret    = var.tailscale_oauth_secret
  tailscale_tailnet         = var.tailscale_tailnet
}
