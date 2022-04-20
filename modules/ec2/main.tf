## Autoscaling Group with 

resource "aws_autoscaling_group" "main_asg" {
  name                      = "${var.stack_name}-infra-asg"
  max_size                  = 2
  min_size                  = 1
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 1
  force_delete              = true
  launch_configuration      = aws_launch_configuration.main_lc.name
  vpc_zone_identifier       = var.subnet_id

  tag {
    key                     = "Name"
    value                   = "${var.stack_name}-infra-ec2"
    propagate_at_launch     = true
  }

  tag {
    key                     = "Environment"
    value                   = var.env
    propagate_at_launch     = true
  }

  timeouts {
    delete                  = "15m"
  }
}

data "aws_ami" "linux" {
  most_recent               = true

  filter {
    name                    = "name"
    values                  = ["amzn2-ami-kernel-5.10-hvm-2.0.20220406.1-x86_64-gp2"]
  }

  filter {
    name                    = "virtualization-type"
    values                  = ["hvm"]
  }

  owners                    = ["137112412989"] # Owner Amazon
}

resource "aws_launch_configuration" "main_lc" {
  name_prefix               = "${var.stack_name}-infra-launch-config"
  image_id                  = data.aws_ami.linux.id
  instance_type             = "t2.micro"
  security_groups           = [aws_security_group.main_sg.id]
  associate_public_ip_address = true

  lifecycle {
    create_before_destroy   = true
  }
}