resource "random_string" "str" {
  length  = 4
  special = false
  upper   = false
}

locals {
  name  = "${var.project}-${lookup(var.short_env, var.env, "noenv")}-${random_string.str.result}"
}