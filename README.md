# devops-tf-evaluation

# Prerequisites
AWS Command Line Interface >= 1.183
Terraform 1.1.8

# Running Terraform
You must set appropriate AWS credentials in the environment before running Terraform.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| stack\_name | Name of stack | string | albert | yes |
| env | Name of environment | string | dev | yes |
| vpc\_cidr\_block | vpc cidr block | string | 10.0.0.0/16 | yes |
| subnet\_cidr\_block | Name of environment | string | dev | yes |

## Outputs
