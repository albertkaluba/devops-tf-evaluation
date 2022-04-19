module "ec2" {
  source           = "./modules/ec2"

  stack_name       = var.stack_name
  env              = var.env
  subnet_id        = module.vpc.subnet_id
  vpc_id           = module.vpc.vpc_id
  vpc_cidr_block   = var.vpc_cidr_block
}