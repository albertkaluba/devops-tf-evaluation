resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name            = "${var.stack_name}-infra-rt"
    Environment     = var.env  
  }

  count = 2
}

resource "aws_route_table_association" "main" {
  subnet_id      = "${element(aws_subnet.main.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.main.*.id, count.index)}"

  count = 2
}

resource "aws_route" "main_default" {
  route_table_id         = "${element(aws_route_table.main.*.id, count.index)}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gw.id

  count = 2
}