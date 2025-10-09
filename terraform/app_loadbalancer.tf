# Application Load Balancer
resource "aws_lb" "alb" {
  name               = "External-LB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = [module.network.public_subnet_id, module.network.public_subnet2_id]
}

# Target Group
resource "aws_lb_target_group" "target_elb" {
  name        = "ALB-TG"
  port        = 3000
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = module.network.vpc_id

  health_check {
    path     = "/health"
    port     = "traffic-port"
    protocol = "HTTP"
  }
}

# Target Attachment (application instance)
resource "aws_lb_target_group_attachment" "app_attachment" {
  target_group_arn = aws_lb_target_group.target_elb.arn
  target_id        = aws_instance.application.id
  port             = 3000
}

# Listener
resource "aws_lb_listener" "listener_elb" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_elb.arn
  }
}

# Security Group
locals {
  ingress_rules = [
    {
      name        = "HTTP"
      port        = 80
      description = "Allow HTTP"
    },
    {
      name        = "SSH"
      port        = 22
      description = "Allow SSH"
    }
  ]
}

resource "aws_security_group" "lb_sg" {
  name        = "CustomSG"
  description = "Allow HTTP inbound traffic"
  vpc_id      = module.network.vpc_id

  egress = [{
    description      = "All outgoing"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }]

  dynamic "ingress" {
    for_each = local.ingress_rules
    content {
      description = ingress.value.description
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  tags = {
    Name = "ALB Security Group"
  }
}
