// Adpated for terragrunt.
// name & vpc_id and aws_region are required parameters

variable "aws_region" {
  type        = string
  description = "AWS region to provisionned the resource in"
}

variable "alarm_actions" {
  type        = list(string)
  description = "Alarm action list"
  default     = [""]
}

variable "alarm_cpu_threshold_percent" {
  type        = number
  description = "CPU threshold alarm level"
  default     = 75
}

variable "alarm_memory_threshold_bytes" {
  type        = number
  description = "Ram threshold alarm level"
  default     = 10000000
}


variable "allowed_cidr_blocks" {
  type        = list(string)
  description = "List of CIDR blocks that are allowed ingress to the cluster's Security Group created in the module"
  default     = [""]
}

variable "allowed_security_groups" {
  type        = list(string)
  description = "List of Security Group IDs that are allowed ingress to the cluster's Security Group created in the module"
}

variable "apply_immediately" {
  type        = bool
  description = "Apply changes immediately"
  default     = true
}
variable "at_rest_encryption_enabled" {
  type        = bool
  description = "Enable encryption at rest"
  default     = false
}
variable "attributes" {
  type        = list(string)
  description = "Additional attributes (_e.g._ 1)"
  default     = [""]
}

variable "auth_token" {
  type        = string
  description = "Auth token for password protecting redis, `transit_encryption_enabled` must be set to `true`. Password must be longer than 16 chars"
  default     = "null"
}
variable "automatic_failover_enabled" {
  type        = bool
  description = "Automatic failover (Not available for T1/T2 instances)"
  default     = false
}
variable "availability_zones" {
  type        = list(string)
  description = "Availability zone IDs"
  default     = [""]
}
variable "cluster_mode_enabled" {
  type        = bool
  description = "Flag to enable/disable creation of a native redis cluster. `automatic_failover_enabled` must be set to `true`. Only 1 `cluster_mode` block is allowed"
  default     = false
}
variable "cluster_mode_num_node_groups" {
  type        = number
  description = "Number of node groups (shards) for this Redis replication group. Changing this number will trigger an online resizing operation before other settings modifications"
  default     = 0
}
variable "cluster_mode_replicas_per_node_group" {
  type        = number
  description = "Number of replica nodes in each node group. Valid values are 0 to 5. Changing this number will force a new resource"
  default     = 0
}
variable "cluster_size" {
  type        = number
  description = "Number of nodes in cluster"
  default     = 1
}
variable "delimiter" {
  type        = string
  description = "Delimiter between `name`, `namespace`, `stage` and `attributes`"
  default     = "-"
}

//variable "elasticache_subnet_group_name" {
//  type = string
//  description = "Subnet group name for the ElastiCache instance"
//  default = ""
//}

variable "enabled" {
  type        = bool
  description = "Set to false to prevent the module from creating any resources"
  default     = true
}
variable "engine_version" {
  type        = string
  description = "Redis engine version"
}
variable "existing_security_groups" {
  type        = list(string)
  description = "List of existing Security Group IDs to place the cluster into. Set `use_existing_security_groups` to `true` to enable using `existing_security_groups` as Security Groups for the cluster"
  default     = [""]
}
variable "family" {
  type        = string
  description = "Redis family"
}
variable "instance_type" {
  type        = string
  description = "Elastic cache instance type"
  default     = "cache.t3.micro"
}
variable "maintenance_window" {
  type        = string
  description = "Maintenance window"
  default     = "wed:03:00-wed:04:00"
}

variable "name" {
  type        = string
  description = "Name of the application"
}
variable "namespace" {
  type        = string
  description = "Namespace (e.g. `eg` or `cp`)"
  default     = ""
}
variable "notification_topic_arn" {
  type        = string
  description = "Notification topic arn"
  default     = "``"
}
variable "ok_actions" {
  type        = list(string)
  description = "The list of actions to execute when this alarm transitions into an OK state from any other state. Each action is specified as an Amazon Resource Number (ARN)"
  default     = [""]
}
//variable "parameter" {
//  type = object
//  description = "A list of Redis parameters to apply. Note that parameters may differ from one Redis family to another"
//  default = "`<list>`"
//}

variable "port" {
  type        = number
  description = "Redis port"
  default     = 6379
}
variable "replication_group_id" {
  type        = string
  description = "Replication group ID with the following constraints: A name must contain from 1 to 20 alphanumeric characters or hyphens. The first character must be a letter. A name cannot end with a hyphen or contain two consecutive hyphens."
  default     = ""
}
variable "snapshot_retention_limit" {
  type        = number
  description = "The number of days for which ElastiCache will retain automatic cache cluster snapshots before deleting them."
  default     = 0
}
variable "snapshot_window" {
  type        = string
  description = "The daily time range (in UTC) during which ElastiCache will begin taking a daily snapshot of your cache cluster."
  default     = "06:30-07:30"
}
variable "env" {
  type        = string
  description = "Stage (e.g. `prod`, `dev`, `staging`)"
  default     = "dev"
}

variable "subnets" {
  type        = list(string)
  description = "Subnet IDs"
}

variable "tags" {
  type        = map(string)
  description = "Additional tags (map of string)"
  default     = {}
}
variable "transit_encryption_enabled" {
  type        = bool
  description = "Enable TLS"
  default     = false 
}
variable "use_existing_security_groups" {
  type        = bool
  description = "Flag to enable/disable creation of Security Group in the module. Set to `true` to disable Security Group creation and provide a list of existing security Group IDs in `existing_security_groups` to place the cluster into"
  default     = false
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "zone_id" {
  type        = string
  description = "Route53 DNS Zone ID"
  default     = ""
}

//variable "parameter" {
//  type = map(string)
//  description = "Extra parameters"
//}

variable "short_env" {
  type = map
  default = {
    development   = "dev"
    developement  = "dev"
    production    = "prod"
    prod          = "prod"
    prd           = "prod"
    staging       = "stag"
    integration   = "int"
    uat           = "uat"
    preproduction = "pprod"
    preprod       = "pprod"
  }
  description = "Use to shorten environement in name. Some limit apply sometinmes on res name."
}

variable "project" {
  type        = string
  description = "Project name (can be use in description)"
}

variable "account_prefix" {
  type        = string
  description = "Short code to describe account purpose"
  default     = "sub"
}
