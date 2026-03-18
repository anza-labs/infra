output "d1_database_id" {
  description = "ID of the D1 database for melody-auth."
  value       = cloudflare_d1_database.auth.id
}

output "kv_namespace_id" {
  description = "ID of the Workers KV namespace for melody-auth."
  value       = cloudflare_workers_kv_namespace.auth.id
}
