################################################################################
#  AWS cloud map namespace
################################################################################

output "namespace_id" {
  description = "The ID of the cloud map namespace"
  value       = try(aws_service_discovery_private_dns_namespace.this[0].id, null)
}

output "namespace_arn" {
  description = "The ARN of the cloud map namespace"
  value       = try(aws_service_discovery_private_dns_namespace.this[0].arn, null)
}

output "namespace_hosted_zone" {
  description = "The ID for the hosted zone that AWS Route 53 creates when you create a namespace"
  value       = try(aws_service_discovery_private_dns_namespace.this[0].hosted_zone, null)
}

output "namespace_tags" {
  description = "The tags of the cloud map namespace resource tags"
  value       = try(aws_service_discovery_private_dns_namespace.this[0].tags_all, null)
}

output "aws_cloud_map_iam_role_arn" {
  description = "The ARN of the IAM role used when pushing logs to Cloudwatch log group"
  value       =  try(aws_iam_role.aws_cloud_map_iam_role[0].arn, null)
}

################################################################################
#  AWS cloud map service
################################################################################

output "namespace_service_id" {
  description = "The ID of the namespace service"
  value       = try(aws_service_discovery_service.this[0].id, null)
}

output "namespace_service_arn" {
  description = "The ARN of the namespace  service"
  value       =  try(aws_service_discovery_service.this[0].arn, null)
}

output "namespace_service_tags_all" {
 description = "A map of tags assigned to the resource, including those inherited from the provider"
 value            =  try(aws_service_discovery_service.this[0].tags_all, null)
}
