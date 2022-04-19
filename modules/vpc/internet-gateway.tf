resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.stack_name}-infra-igw"
    Environment = var.env
  }
}