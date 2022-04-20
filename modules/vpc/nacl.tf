resource "aws_network_acl" "main" {
  vpc_id             = aws_vpc.main.id

  ingress {
    protocol         = "tcp"
    rule_no          = 100
    action           = "allow"
    cidr_block       = var.vpc_cidr_block
    from_port        = 22
    to_port          = 22
  }

  tags = {
    Name             = "${var.stack_name}-nacl"
    Environment      = var.env
    Stack_Name       = var.stack_name
  }
}

## Need to upgrade aws provider to 4.10
# resource "aws_network_acl_association" "main" {
#   network_acl_id = aws_network_acl.main.id
#   subnet_id      = "${element(aws_subnet.main.*.id, count.index)}"

#   count = 2
# }