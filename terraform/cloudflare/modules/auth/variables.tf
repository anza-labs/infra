variable "account_id" {
  type        = string
  description = "Cloudflare account ID."
}

variable "d1_database_name" {
  type        = string
  description = "Name for the D1 database."
  default     = "melody-auth"
}

variable "kv_namespace_title" {
  type        = string
  description = "Title for the Workers KV namespace."
  default     = "melody-auth"
}
