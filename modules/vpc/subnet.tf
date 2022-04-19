data "aws_availability_zones" "all" {}

resource "aws_subnet" "main" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "${element(var.subnet_cidr_block, count.index)}"
  availability_zone = "${element(data.aws_availability_zones.all.names, count.index)}"

  tags = {
    Name            = "${var.stack_name}-infra-subnet"
    Environment     = var.env
  }

  count = 2
}