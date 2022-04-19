resource "aws_network_acl" "main" {
  vpc_id = aws_vpc.main.id

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = var.cidr_block
    from_port  = 22
    to_port    = 22
  }

  tags = {
    Name = "${var.stack_name}-nacl"
    Environment = var.env
  }
}