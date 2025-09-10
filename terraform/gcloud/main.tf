provider "google" {
  project = var.project_id
  region  = var.region
  zone    = "${var.region}-${var.zone}"
}

module "gcloud_vm" {
  source = "./modules/always_free"

  instance_name             = "micro"
  instance_shape            = "e2-micro"
  otel_collector_config_url = "https://raw.githubusercontent.com/anza-labs/infra/refs/heads/main/configs/otel/otelcol-docker.yaml"
  registry_config_url       = "https://raw.githubusercontent.com/anza-labs/infra/refs/heads/main/configs/registry/config.yml"

  region                    = var.region
  discord_webhook           = var.discord_webhook
  ssh_public_keys           = var.ssh_public_keys
  tailscale_oauth_client_id = var.tailscale_oauth_client_id
  tailscale_oauth_secret    = var.tailscale_oauth_secret
  tailscale_tailnet         = var.tailscale_tailnet
}
