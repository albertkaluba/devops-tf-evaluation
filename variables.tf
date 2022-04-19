variable "stack_name" {}

variable "env" {}

variable "vpc_cidr_block" {}

variable "subnet_cidr_block" {
    type = list
}