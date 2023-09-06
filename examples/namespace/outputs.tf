################################################################################
#  AWS cloud map namespace
################################################################################

output "namespace_id" {
  description = "The ID of the cloud map namespace"
  value       = try(module.namespace.namespace_id, null)
}

output "namespace_arn" {
  description = "The ARN of the cloud map namespace"
  value       = try(module.namespace.namespace_arn, null)
}

output "namespace_hosted_zone" {
  description = "The ID for the hosted zone that AWS Route 53 creates when you create a namespace"
  value       = try(module.namespace.namespace_hosted_zone, null)
}

output "namespace_tags" {
  description = "The tags of the cloud map namespace resource tags"
  value       = try(module.namespace.namespace_tags, null)
}


output "aws_cloud_map_iam_role_arn" {
  description = "The ARN of the IAM role used when pushing logs to Cloudwatch log group"
  value       = try(module.namespace.aws_cloud_map_iam_role_arn, null)
}