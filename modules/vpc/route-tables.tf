resource "aws_route_table" "example" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "${element(var.subnet_cidr_block, count.index)}"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name            = "${var.stack_name}-infra-rt"
    Environment     = var.env  
  }
}