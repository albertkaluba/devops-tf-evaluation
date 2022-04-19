module "vpc" {
    source = "./modules/vpc"

    stack_name = var.stack_name
    env        = var.env
    cidr_block = var.cidr_block
}