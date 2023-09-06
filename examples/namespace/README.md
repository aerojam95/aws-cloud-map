# aws-cloud-map Terraform module

Configuration in this directory is for AWS Cloud Map Namespace where a VPC has
already been deployed in the same AWS region.

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform fmt
$ terraform validate
$ terraform plan --out
$ terraform apply --auto-approve
```

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

| Name | Source | Version |
|------|--------|---------|
| <a name="module_namespace"></a> [vpc](#module\_vpc) | ../../ | n/a |No modules required.

## Resources

| Name | Type |
|------|------|
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_vpc) | data source |

## Inputs

No inputs are required.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_namespace_id"></a> [namespace\_id](#output\_namespace\_id) | The ID of the cloud map namespace" |
| <a name="output_namespace_arn"></a> [namespace\_arn](#output\namespace\_arn) | The ARN of the cloud map namespace" |
| <a name="output_namespace_hosted_zone"></a> [namespace\_hosted\_zone](#output\_namespace\_hosted\_zone) | The ID for the hosted zone that AWS Route 53 creates when you create a namespace |
| <a name="output_namespace_tags"></a> [namespace\_tags](#output\namespace\_tags) | The tags of the cloud map namespace resource tags |
| <a name="output_aws_cloud_map_iam_role_arn"></a> [aws\_cloud\_map\_iam\_role\_arn](#output\_aws\_cloud\_map\_iam\_role\_arn) | The ARN of the IAM role used when pushing logs to Cloudwatch log group" |