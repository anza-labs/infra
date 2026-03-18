resource "cloudflare_d1_database" "auth" {
  account_id = var.account_id
  name       = var.d1_database_name
}

resource "cloudflare_workers_kv_namespace" "auth" {
  account_id = var.account_id
  title      = var.kv_namespace_title
}
