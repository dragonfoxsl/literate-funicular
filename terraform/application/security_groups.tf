// Enable Ingress from the ALB SG
resource "aws_security_group" "staging_application_instance_sg" {
  name        = "[test]staging-application-instance-sg"
  description = "[test]staging-application-instance-sg"
  vpc_id      = local.staging_application_vpc.id

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["${aws_security_group.staging_application_alb_sg.id}"]
  }
  
  egress {
    description      = "Any"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name        = "[test]staging-application-instance-sg"
    "component" = "host_instance_sg"
  }
}


// Enable Ingress from the All
resource "aws_security_group" "staging_application_alb_sg" {
  name        = "[test]staging-application-alb-sg"
  description = "[test]staging-application-alb-sg"
  vpc_id      = local.staging_application_vpc.id

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    description      = "Any"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name        = "[test]staging-application-alb-sg"
    "component" = "alb_sg"
  }
}