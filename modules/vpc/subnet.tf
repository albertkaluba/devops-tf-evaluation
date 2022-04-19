resource "aws_subnet" "main" {
  vpc_id        = aws_vpc.main.id
  cidr_block    = var.subnet_cidr_block

  tags = {
    Name        = "${var.stack_name}-infra-subnet"
    Environment = var.env
  }
}