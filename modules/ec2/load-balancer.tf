resource "aws_elb" "main" {
  name               = "${var.stack_name}-infra-elb"
  subnets            = var.subnet_id
  security_groups    = [aws_security_group.lb_sg.id]

  listener {
    instance_port     = 22
    instance_protocol = "tcp"
    lb_port           = 22
    lb_protocol       = "tcp"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "tcp:22"
    interval            = 30
  }

  tags = {
    Name             = "${var.stack_name}-infra-elb"
    Environment      = var.env
    Stack_Name       = var.stack_name    
  }
}