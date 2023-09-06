###############################################################################
# AWS cloud map module: 
###############################################################################

# Set local variables
locals {
  
  name = "example-namespace"
  region = "eu-west-2"

}

# VPC data to deploy Namesapce
data "aws_vpc" "vpc" {
  default = true
}

# AWS cloud map namespace
module "namespace" {

  source = "../../"

  region = local.region

  tags = {
    "Example"    = "aws-cloup-map-namespace",
    "GitHubRepo" = "aws-cloud-map"
  }
  
  vpc_id  = data.aws_vpc.vpc.id
  vpc_arn = [data.aws_vpc.vpc.arn]

  #############################################################################
  # Cloud map namespace
  #############################################################################

  name        = local.name
  description = "Example AWS cloud map namespace with local default VPC access"

  namespace_tags = {
    "Name" = local.name
  }

}