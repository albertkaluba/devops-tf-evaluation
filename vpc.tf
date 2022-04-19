module "vpc" {
    source            = "./modules/vpc"

    stack_name        = var.stack_name
    env               = var.env
    vpc_cidr_block    = var.vpc_cidr_block
    subnet_cidr_block = var.subnet_cidr_block
}