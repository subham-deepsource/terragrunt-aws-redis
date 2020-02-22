include {
  path = "${find_in_parent_folders()}"
}

terraform {
  source = "git::git@github.com:bitintheskud/terragrunt-aws-redis.git?ref=v1.0.6"
}

dependency "instances" {
  config_path = "../ec2-instances"
}

dependency "vpc" {
  config_path = "../vpc"
}

locals {
  aws_region     = basename(dirname(get_terragrunt_dir()))
  project        = "my_project_code"
  env            = "production"
  name           = "${local.branch}-${local.project}"
  engine_version = "3.2.10"
  family         = "redis3.2"
  cluster_size   = 2
  custom_tags    = yamldecode(file("${get_terragrunt_dir()}/${find_in_parent_folders("custom_tags.yaml")}"))

}


inputs = {
  "project" = local.project
  "vpc_id"  = dependency.vpc.outputs.vpc_id
  "subnets" = dependency.vpc.outputs.private_subnet_ids
  "availability_zones" = dependency.vpc.outputs.availability_zones
  "name"    = local.name
  "allowed_security_groups" = [
    dependency.instances.outputs.instance_security_group_id
  ]
  "aws_region"     = local.aws_region
  "branch"         = local.branch
  "custom_tags"    = local.custom_tags
  "env"            = local.env
  "3tags3"         = local.custom_tags
  "engine_version" = local.engine_version
  "cluster_size"   = local.cluster_size
  "engine_version" = local.engine_version
  "family"         = local.family
}
