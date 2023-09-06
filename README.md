# aws-cloud-map Terraform module

Terraform module that creates AWS cloud map namespaces and services with access
to local VPCs on AWS.

## Usage

```hcl
data "aws_vpc" "vpc" {
  default = true
}

module "namespace" {

  source = "https://github.com/aerojam95/aws-cloud-map.git"

  region = "eu-west-2"

  tags = {
    "Example"    = "aws-cloup-map-namespace",
    "GitHubRepo" = "aws-cloud-map"
  }
  
  vpc_id  = data.aws_vpc.vpc.id
  vpc_arn = [data.aws_vpc.vpc.arn]

  name        = local.name
  description = "Example AWS cloud map namespace with local default VPC access"

  namespace_tags = {
    "Name" = example-namespace
  }

}
```

## Examples

- [AWS Cloud Map namespace in default VPC](https://github.com/aerojam95/aws-cloud-map/tree/main/examples/namespace)



## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.0 |

## Modules

No modules required.

## Resources

| Name | Type |
|------|------|
| [aws_service_discovery_private_dns_namespace.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/service_discovery_private_dns_namespace) | resource |
| [aws_iam_role.aws_cloud_map_iam_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_policy_document.aws_cloud_map_assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | resource |
| [aws_iam_role_policy_attachment.aws_cloud_map_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy.aws_cloud_map_iam_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy_document.aws_cloud_map_iam_policy_document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | resource |
| [aws_service_discovery_service.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/service_discovery_service) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_region"></a> [region](#input\_region) | An AWS region for the VPC infrastructure to be deployed | `string` | `null` | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | ID of VPC in which to deploy | `string` | `null` | yes |
| <a name="input_vpc_arn"></a> [vpc\_arn](#input\_vpc\_arn) | ARN of VPC in which to deploy | `list(string)` | `[]` | yes |
| <a name="input_create_namespace"></a> [create\_namespace](#input\_create\_namespace) | Controls if cloud map namespace should be created | `bool` | `true` | no |
| <a name="input_create_aws_cloud_map_iam_role"></a> [create\_aws\_cloud\_map\_iam\_role](#input\_create\_aws\_cloud\_map\_iam\_role) | Controls if an iam role for cloud map namespace should be created | `bool` | `true` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the namespace and service | `string` | `null` | no |
| <a name="input_description"></a> [description](#input\_description) | The description of the service | `string` | `null` | no |
| <a name="input_namespace_tags"></a> [namespace_tags](#input\_namespace\_tags) | Additional tags for the namespace | `map(string)` | `{}` | no |
| <a name="input_create_namespace_service"></a> [create_namespace_service](#input\_create\_namespace\_service) | Controls if cloud map namespace service should be created | `bool` | `false` | no |
| <a name="input_create_dns_config"></a> [create_dns_config](#input\_create\_dns\_config) | Controls if DNS configurations for cloud map namespace services should be created | `bool` | `false` | no |
| <a name="input_create_health_check_config"></a> [create_health_check_config](#input\_create\_health\_check\_config) | Controls if health checks are implemented | `bool` | `false` | no |
| <a name="input_create_health_check_custom_config"></a> [create_health_check_custom_config](#input\_create\_health\_check\_custom\_config) | Controls if custom health checks are implemented | `bool` | `false` | no |
| <a name="input_namespace_service_name"></a> [namespace_service_name](#input\_namespace\_service\_name) | The name of the AWS cloud map namespace service | `string` | `null` | no |
| <a name="input_force_destroy"></a> [force_destroy](#input\_force\_destroy) | A boolean that indicates all instances should be deleted from the service so that the service can be destroyed without error. These instances are not recoverable | `bool` | `false` | no |
| <a name="input_ttl"></a> [ttl](#input\_ttl) | The amount of time, in seconds, that you want DNS resolvers to cache the settings for this resource record set | `number` | `10` | no |
| <a name="input_dns_record_type"></a> [dns_record_type](#input\_dns\_record\_type) | The type of the resource, which indicates the value that Amazon Route 53 returns in response to DNS queries | `string` | `A` | no |
| <a name="input_routing_policy"></a> [routing_policy](#input\_routing\_policy) | The routing policy that you want to apply to all records that Route 53 creates when you register an instance and specify the service | `string` | `MULTIVALUE` | no |
| <a name="input_failure_threshold"></a> [failure_threshold](#input\_failure\_threshold) | The number of consecutive health checks. Maximum value of 10 | `number` | `10` | no |
| <a name="input_resource_path"></a> [resource_path](#input\_resource_path) | The path that you want Route 53 to request when performing health checks. Route 53 automatically adds the DNS name for the service | `string` | `/` | no |
| <a name="input_health_check_type"></a> [health_check_type](#input\_health\_check\_type) | The type of health check that you want to create, which indicates how Route 53 determines whether an endpoint is healthy | `string` | `HTTPS` | no |
| <a name="input_custopm_failure_threshold"></a> [custom_failure_threshold](#input\_custom\_failure\_threshold) | The number of 30-second intervals that you want service discovery to wait before it changes the health status of a service instance. Maximum value of 10 | `number` | `1` | no |


## Outputs

| Name | Description |
|------|-------------|
| <a name="output_namespace_id"></a> [namespace\_id](#output\_namespace\_id) | The ID of the cloud map namespace |
| <a name="output_namespace_arn"></a> [namespace\_arn](#output\_namespace\_arn) | The ARN of the cloud map namespace |
| <a name="output_namespace_hosted_zone"></a> [namespace\_hosted_zone](#output\_namespace\_hosted_zone) | The ID for the hosted zone that AWS Route 53 creates when you create a namespace |
| <a name="output_namespace_tags"></a> [namespace\_tags](#output\_namespace\_tags) | The tags of the cloud map namespace resource tags |
| <a name="output_aws_cloud_map_iam_role_arn"></a> [aws\_cloud\_map\_iam\_role\_arn](#output\_aws\_cloud\_map\_\iam\_role\_arn) | The ARN of the IAM role used when pushing logs to Cloudwatch log group |
| <a name="output_namespace_service_id"></a> [namespace\_service\_id](#output\_namespace\_service\_id) | The ID of the namespace service |
| <a name="output_namespace_service_arn"></a> [namespace\_service\_arn](#output\_namespace\_service\_arn) | The ARN of the namespace service |
| <a name="output_namespace_service_tags_all"></a> [namespace\_service\_tags\_all](#output\_namespace\_service\_tags\_all) | A map of tags assigned to the resource, including those inherited from the provider |