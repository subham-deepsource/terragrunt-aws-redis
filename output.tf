output "endpoint" {
  value = module.redis.endpoint
  description = "Redis primary endpoint."
}

output "host" {
  value = module.redis.host
  description = "Redis hostname."
}

output "name" {
  value = module.redis.id
  description = "Redis cluster ID."
}

output "port" {
  value = module.redis.port
  description = "Redis port."
}

output "security_group_id" {
  value = module.redis.security_group_id
  description = "Redis security group ID."
}