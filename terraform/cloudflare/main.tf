provider "cloudflare" {
  api_token = var.cloudflare_api_key
}

module "auth" {
  source = "./modules/auth"

  account_id = var.cloudflare_account_id
}
