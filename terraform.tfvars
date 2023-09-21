################################################################################
# General variables
################################################################################

region  = ""
tags    = {}
vpc_id  = ""
vpc_arn = []

################################################################################
# AWS cloud map namespace
################################################################################

create_namespace              = true
create_aws_cloud_map_iam_role = true
name                          = "" # ususally a web address
description                   = ""

namespace_tags = {
  "AWS-cloud-map-namespace" = ""
}

################################################################################
# AWS cloud map service
################################################################################

create_namespace_service          = true
create_dns_config                 = true  # if turning off change namespace_id in main to the base resource to deploy or it will fail
create_health_check_config        = false # only works wiht public DNS namespaces
create_health_check_custom_config = false
namespace_service_name            = "AWS-cloud-map-service-"
force_destroy                     = false
ttl                               = 10
dns_record_type                   = "A"
routing_policy                    = "MULTIVALUE"
failure_threshold                 = 10
resource_path                     = "/"
health_check_type                 = "HTTPS"
custom_failure_threshold          = 1