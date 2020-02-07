resource "random_string" "str" {
  length  = 4
  special = false
  upper   = false
}

locals {
  name_prefix        = "${var.project}-${lookup(var.short_env, var.env, "noenv")}"
  name_id            = "${random_string.str.result}"
}