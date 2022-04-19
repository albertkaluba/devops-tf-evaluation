resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
  
  tags = {
      Name = "${var.stack_name}-vpc"
      Environment = var.env
  }
}