## security group allowing ssh inbound traffic on port 22

resource "aws_security_group" "main_sg" {
  name               = "${var.stack_name}-infra-sg"
  description        = "Allow ssh inbound traffic"
  vpc_id             = var.vpc_id

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.vpc_cidr_block]
  }

  tags = {
    Name             = "${var.stack_name}-infra-sg"
    Environment      = var.env
    Stack_Name       = var.stack_name  
  }
}