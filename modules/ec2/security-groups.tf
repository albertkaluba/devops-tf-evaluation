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


resource "aws_security_group" "lb_sg" {
  name               = "${var.stack_name}-infra-sg"
  description        = "Allow ssh inbound traffic"
  vpc_id             = var.vpc_id

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [var.vpc_cidr_block]
  }

  tags = {
    Name             = "${var.stack_name}-infra-sg"
    Environment      = var.env
    Stack_Name       = var.stack_name  
  }
}

resource "aws_security_group_rule" "egress_lb_to_main_sg" {
  type                     = "egress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = aws_security_group.lb_sg.id
  source_security_group_id = aws_security_group.main_sg.id
}