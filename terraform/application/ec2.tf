# Staging Application Instance

resource "aws_instance" "staging_application_instance" {
  ami           = data.aws_ami.ubuntu_2204_arm64.image_id
  instance_type = "t4g.small"

  availability_zone           = var.availability_zone_b
  subnet_id                   = local.staging_application_vpc_ec2_private_subnets[1].id
  associate_public_ip_address = true

  vpc_security_group_ids = [aws_security_group.staging_application_instance_sg.id]
  iam_instance_profile   = "ec2-session-manager-role"
  key_name               = "key-name"
  user_data              = file("init.sh")

  disable_api_termination = true
  monitoring              = true

  root_block_device {
    volume_type = "gp2"
    volume_size = 20

    tags = {
      Name        = "[test]staging-application-instance"
      "component" = "host_instance_storage"
    }
  }

  credit_specification {
    cpu_credits = "standard"
  }

  tags = {
    Name        = "[test]staging-application-instance"
    "component" = "host_instance"
    "os"        = "ubuntu-2204"
  }

  lifecycle {
    ignore_changes = [
      ami,
    ]
  }
}