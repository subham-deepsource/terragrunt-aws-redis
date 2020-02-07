# Terragrunt AWS Redis 

## Description

Terragrunt module for redis. 

Base module is from :

https://github.com/cloudposse/terraform-aws-elasticache-redis

See their documentation for supported parameters. 

## Providers

| Name | Version |
|------|---------|
| aws | n/a |
| random | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| account\_prefix | Short code to describe account purpose | `string` | `"sub"` | no |
| alarm\_actions | Alarm action list | `list(string)` | <pre>[<br>  ""<br>]<br></pre> | no |
| alarm\_cpu\_threshold\_percent | CPU threshold alarm level | `number` | `75` | no |
| alarm\_memory\_threshold\_bytes | Ram threshold alarm level | `number` | `10000000` | no |
| allowed\_cidr\_blocks | List of CIDR blocks that are allowed ingress to the cluster's Security Group created in the module | `list(string)` | <pre>[<br>  ""<br>]<br></pre> | no |
| allowed\_security\_groups | List of Security Group IDs that are allowed ingress to the cluster's Security Group created in the module | `list(string)` | n/a | yes |
| apply\_immediately | Apply changes immediately | `bool` | `true` | no |
| at\_rest\_encryption\_enabled | Enable encryption at rest | `bool` | `false` | no |
| attributes | Additional attributes (\_e.g.\_ 1) | `list(string)` | <pre>[<br>  ""<br>]<br></pre> | no |
| auth\_token | Auth token for password protecting redis, `transit_encryption_enabled` must be set to `true`. Password must be longer than 16 chars | `string` | `"null"` | no |
| automatic\_failover\_enabled | Automatic failover (Not available for T1/T2 instances) | `bool` | `false` | no |
| availability\_zones | Availability zone IDs | `list(string)` | <pre>[<br>  ""<br>]<br></pre> | no |
| aws\_region | AWS region to provisionned the resource in | `string` | n/a | yes |
| cluster\_mode\_enabled | Flag to enable/disable creation of a native redis cluster. `automatic_failover_enabled` must be set to `true`. Only 1 `cluster_mode` block is allowed | `bool` | `false` | no |
| cluster\_mode\_num\_node\_groups | Number of node groups (shards) for this Redis replication group. Changing this number will trigger an online resizing operation before other settings modifications | `number` | `0` | no |
| cluster\_mode\_replicas\_per\_node\_group | Number of replica nodes in each node group. Valid values are 0 to 5. Changing this number will force a new resource | `number` | `0` | no |
| cluster\_size | Number of nodes in cluster | `number` | `1` | no |
| delimiter | Delimiter between `name`, `namespace`, `stage` and `attributes` | `string` | `"-"` | no |
| enabled | Set to false to prevent the module from creating any resources | `bool` | `true` | no |
| engine\_version | Redis engine version | `string` | `"5.0.6"` | no |
| env | Stage (e.g. `prod`, `dev`, `staging`) | `string` | `"dev"` | no |
| existing\_security\_groups | List of existing Security Group IDs to place the cluster into. Set `use_existing_security_groups` to `true` to enable using `existing_security_groups` as Security Groups for the cluster | `list(string)` | <pre>[<br>  ""<br>]<br></pre> | no |
| family | Redis family | `string` | `"redis5.0"` | no |
| instance\_type | Elastic cache instance type | `string` | `"cache.t3.micro"` | no |
| maintenance\_window | Maintenance window | `string` | `"wed:03:00-wed:04:00"` | no |
| name | Name of the application | `string` | n/a | yes |
| namespace | Namespace (e.g. `eg` or `cp`) | `string` | `""` | no |
| notification\_topic\_arn | Notification topic arn | `string` | `"`" | no |
| ok\_actions | The list of actions to execute when this alarm transitions into an OK state from any other state. Each action is specified as an Amazon Resource Number (ARN) | `list(string)` | <pre>[<br>  ""<br>]<br></pre> | no |
| port | Redis port | `number` | `6379` | no |
| project | Project name (can be use in description) | `string` | n/a | yes |
| replication\_group\_id | Replication group ID with the following constraints: A name must contain from 1 to 20 alphanumeric characters or hyphens. The first character must be a letter. A name cannot end with a hyphen or contain two consecutive hyphens. | `string` | `""` | no |
| short\_env | Use to shorten environement in name. Some limit apply sometinmes on res name. | `map` | <pre>{<br>  "developement": "dev",<br>  "development": "dev",<br>  "integration": "int",<br>  "prd": "prod",<br>  "preprod": "pprod",<br>  "preproduction": "pprod",<br>  "prod": "prod",<br>  "production": "prod",<br>  "staging": "stag",<br>  "uat": "uat"<br>}<br></pre> | no |
| snapshot\_retention\_limit | The number of days for which ElastiCache will retain automatic cache cluster snapshots before deleting them. | `number` | `0` | no |
| snapshot\_window | The daily time range (in UTC) during which ElastiCache will begin taking a daily snapshot of your cache cluster. | `string` | `"06:30-07:30"` | no |
| subnets | Subnet IDs | `list(string)` | n/a | yes |
| tags | Additional tags (map of string) | `map(string)` | `{}` | no |
| transit\_encryption\_enabled | Enable TLS | `bool` | `true` | no |
| use\_existing\_security\_groups | Flag to enable/disable creation of Security Group in the module. Set to `true` to disable Security Group creation and provide a list of existing security Group IDs in `existing_security_groups` to place the cluster into | `bool` | `false` | no |
| vpc\_id | VPC ID | `string` | n/a | yes |
| zone\_id | Route53 DNS Zone ID | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| endpoint | Redis primary endpoint. |
| host | Redis hostname. |
| name | Redis cluster ID. |
| port | Redis port. |
| security\_group\_id | Redis security group ID. |

