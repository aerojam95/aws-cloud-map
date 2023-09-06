## https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/service_discovery_service#attributes-reference

locals {

  create_namespace              = var.create_namespace
  create_aws_cloud_map_iam_role = var.create_aws_cloud_map_iam_role
  region                        = var.region

}

################################################################################
# Cloud map namespace
################################################################################

resource "aws_service_discovery_private_dns_namespace" "this" {

  count = local.create_namespace ? 1 : 0

  name        = var.name
  description = var.description
  vpc         = var.vpc_id

  tags = merge(
    {"Name" = format("${var.name}-aws-cloud-map-namespace")},
    var.tags,
    var.namespace_tags,
  )

}

resource "aws_iam_role" "aws_cloud_map_iam_role" {

  count = local.create_aws_cloud_map_iam_role ? 1 : 0

  name_prefix        = "aws-cloud-map-iam-role-"
  assume_role_policy = data.aws_iam_policy_document.aws_cloud_map_assume_role[0].json

  tags = merge(
    {"Name" = format("${var.name}-aws-cloud-map-iam-role")},
    var.tags,
    var.namespace_tags
  )

}

data "aws_iam_policy_document" "aws_cloud_map_assume_role" {

  count = local.create_aws_cloud_map_iam_role ? 1 : 0

  statement {
    sid = "AWSCloudMapAssumeRole"
    principals {
      type        = "Service"
      identifiers = ["servicediscovery.amazonaws.com"]
    }
    effect = "Allow"
    actions = ["sts:AssumeRole"]
  }

}

resource "aws_iam_role_policy_attachment" "aws_cloud_map_attachment" {

  count = local.create_aws_cloud_map_iam_role? 1 : 0

  role       = aws_iam_role.aws_cloud_map_iam_role[0].name
  policy_arn = aws_iam_policy.aws_cloud_map_iam_policy[0].arn

}

resource "aws_iam_policy" "aws_cloud_map_iam_policy" {

  count = local.create_aws_cloud_map_iam_role ? 1 : 0

  name_prefix = "aws-cloud-map-iam-role-"
  policy      = data.aws_iam_policy_document.aws_cloud_map_iam_policy_document[0].json
  
  tags = merge(
    {"Name" = format("${var.name}-aws-cloud-map-iam-role")},
    var.tags,
    var.namespace_tags
  )

}

data "aws_iam_policy_document" "aws_cloud_map_iam_policy_document" {

  count = local.create_aws_cloud_map_iam_role ? 1 : 0

  statement {
    sid = "AWSCloudMapAccess"
    effect = "Allow"
    actions = [
      "ec2:DescribeVpcs",
      "ec2:DescribeSubnets",
      "ec2:DescribeSecurityGroups"
    ]
    resources = var.vpc_arn
  }

}


################################################################################
# Service for a cloud map namespace/ECS cluster
################################################################################

locals {

  create_namespace_service          = var.create_namespace_service && var.create_namespace
  create_dns_config                 = var.create_dns_config && var.create_namespace_service && var.create_namespace
  create_health_check_config        = var.create_health_check_config && var.create_namespace_service && !var.create_health_check_custom_config
  create_health_check_custom_config = var.create_health_check_custom_config && var.create_namespace_service && !var.create_health_check_config

}

resource "aws_service_discovery_service" "this" {

  count = local.create_namespace_service ? 1 : 0

  name          = var.namespace_service_name
  force_destroy = var.force_destroy

  dynamic "dns_config" {
    for_each = var.create_dns_config ? [1] : []
    content {
      namespace_id = aws_service_discovery_private_dns_namespace.this[count.index].id
      dns_records {
        ttl  = var.ttl
        type = var.dns_record_type
      }
      routing_policy = var.routing_policy
    }
  }

  # Only for public DNS namespaces
  dynamic "health_check_config" {
    for_each = var.create_health_check_config ? [1] : []
    content {
      failure_threshold = var.failure_threshold
      resource_path     = var.resource_path
      type              = var.health_check_type
    }
  }

  dynamic "health_check_custom_config" {
   for_each = var.create_health_check_custom_config ? [1] : []
   content {
     failure_threshold = var.custom_failure_threshold
    }
  }

}

