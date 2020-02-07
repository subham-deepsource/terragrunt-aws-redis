resource "random_string" "str" {
  length  = 4
  special = false
  upper   = false
}

locals {
  uniq = "${lookup(var.short_env, var.env, "noenv")}-${random_string.str.result}"
}