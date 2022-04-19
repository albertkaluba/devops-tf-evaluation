## Elastic Load Balancer forwarding traffic to port 22

resource "aws_lb" "main" {
  name               = "${var.stack_name}-infra-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.main_sg.id]
  subnets            = var.subnet_id

  enable_deletion_protection = true

  tags = {
    Name             = "${var.stack_name}-infra-lb"
    Environment      = var.env
    Stack_Name       = var.stack_name
  }
}

resource "aws_lb_listener" "main" {
  load_balancer_arn = aws_lb.main.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main.arn
  }
}

resource "aws_lb_target_group" "main" {
  name               = "${var.stack_name}-infra-lb-tg"
  port               = 22
  protocol           = "TCP"
  vpc_id             = var.vpc_id
}