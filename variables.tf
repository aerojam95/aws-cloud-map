################################################################################
# General variables
################################################################################
  
variable "region" {
  description = "An AWS region for the VPC infrastructure to be deployed"
  type        = string
  default     = ""
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "vpc_id" {
  description = "ID of VPC in which to deploy"
  type        = string
  default     = ""
}

variable "vpc_arn" {
  description = "ARN of VPC in which to deploy"
  type = list(string)
  default = []
}

################################################################################
# AWS cloud map namespace
################################################################################

variable "create_namespace" {
  description = "Controls if cloud map namespace should be created"
  type        = bool
  default     = true
}

variable "create_aws_cloud_map_iam_role" {
  description = "Controls if an iam role for cloud map namespace should be created"
  type        = bool
  default     = true
}

variable "name" {
  description = "The name of the namespace and service"
  type        = string
  default     = ""
}

variable "description" {
  description = "The description of the service"
  type        = string
  default     = ""
}

variable "namespace_tags" {
  description = "Additional tags for the namespace"
  type        = map(string)
  default     = {}
}

################################################################################
#  AWS cloud map service
################################################################################

variable "create_namespace_service" {
  description = "Controls if cloud map namespace service should be created"
  type        = bool
  default     = false
}

variable "create_dns_config" {
  description = "Controls if DNS configurations for cloud map namespace services should be created"
  type        = bool
  default     = false
}

variable "create_health_check_config" {
  description = "Controls if health checks are implemented"
  type        = bool
  default     = false
}

variable "create_health_check_custom_config" {
  description = "Controls if custom health checks are implemented"
  type        = bool
  default     = false
}

variable "namespace_service_name" {
  description = "The name of the AWS cloud map namespace service"
  type        = string
  default     = ""
}

variable "force_destroy" {
  description = "A boolean that indicates all instances should be deleted from the service so that the service can be destroyed without error. These instances are not recoverable"
  type        = bool
  default     = false
}

variable "ttl" {
  description = "The amount of time, in seconds, that you want DNS resolvers to cache the settings for this resource record set"
  type        = number
  default     = "10"
}

variable "dns_record_type" {
  description = "The type of the resource, which indicates the value that Amazon Route 53 returns in response to DNS queries"
  type        = string
  default     = "A"
}

variable "routing_policy" {
  description = "The routing policy that you want to apply to all records that Route 53 creates when you register an instance and specify the service"
  type        = string
  default     = "MULTIVALUE"
}

variable "failure_threshold" {
  description = "The number of consecutive health checks. Maximum value of 10"
  type        = number
  default     = 10
}

variable "resource_path" {
  description = "The path that you want Route 53 to request when performing health checks. Route 53 automatically adds the DNS name for the service"
  type        = string
  default     = "/"
}

variable "health_check_type" {
  description = "The type of health check that you want to create, which indicates how Route 53 determines whether an endpoint is healthy"
  type        = string
  default     = "HTTPS"
}

variable "custom_failure_threshold" {
  description = "The number of 30-second intervals that you want service discovery to wait before it changes the health status of a service instance. Maximum value of 10"
  type        = number
  default     = "1"
}