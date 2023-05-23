resource "aws_alb" "staging_application_alb" {
  name               = "staging-application-alb"
  load_balancer_type = "application"
  internal           = true

  subnets         = local.staging_application_vpc_public_subnets[*].id
  security_groups = [aws_security_group.staging_application_alb_sg.id]

  enable_deletion_protection = true

  tags = {
    Name        = "staging-application-alb"
    "component" = "host-instance-alb"
  }
}

resource "aws_alb_listener" "staging_application_listener_443" {
  load_balancer_arn = aws_alb.staging_application_alb.arn
  protocol          = "HTTPS"
  port              = 443

  ssl_policy      = "ELBSecurityPolicy-2016-08"
  certificate_arn = local.staging_test_certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.staging_application_tg.arn
  }

  tags = {
    Name        = "staging-application-listener-443"
    "component" = "host-instance-alb"
  }
}

# Redirect HTTP traffic to HTTPS
resource "aws_alb_listener" "staging_application_listener_80" {
  load_balancer_arn = aws_alb.staging_application_alb.arn
  protocol          = "HTTP"
  port              = 80

  default_action {
    type = "redirect"

    redirect {
      protocol    = "HTTPS"
      port        = "443"
      status_code = "HTTP_301"
    }
  }

  tags = {
    Name        = "staging-application-listener-80"
    "component" = "host-instance-alb"
  }
}

resource "aws_alb_target_group" "staging_application_tg" {
  name     = "staging-application-tg"
  vpc_id   = local.staging_application_vpc
  protocol = "HTTP"
  port     = 80

  tags = {
    Name        = "staging-application-tg"
    "component" = "host-instance-tg"
  }
}

resource "aws_alb_target_group_attachment" "staging_application_tg_attachment" {
  target_group_arn = aws_alb_target_group.staging_application_tg.arn
  target_id        = aws_instance.staging_application_instance.id
  port             = 80
}
