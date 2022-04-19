resource "aws_vpc" "main" {
  cidr_block         = var.vpc_cidr_block

  tags = {
    Name             = "${var.stack_name}-vpc"
    Environment      = var.env
    Stack_Name       = var.stack_name
  }
}