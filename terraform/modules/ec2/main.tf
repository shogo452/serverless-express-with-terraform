# ----------------------------------------------------------
# Key Pair
# ----------------------------------------------------------
locals {
  public_key_file  = "./.key_pair/${var.key_pair_name}/id_rsa_sample_dev.pub"
  private_key_file = "./.key_pair/${var.key_pair_name}/id_rsa_sample_dev"
}

resource "tls_private_key" "main" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "private_key_pem" {
  filename = local.private_key_file
  content  = tls_private_key.main.private_key_pem
}

resource "local_file" "public_key_openssh" {
  filename = local.public_key_file
  content  = tls_private_key.main.public_key_openssh
}

resource "aws_key_pair" "main" {
  key_name   = var.key_pair_name
  public_key = tls_private_key.main.public_key_openssh
  provisioner "local-exec" {
    command = "chmod 600 ${local.private_key_file}"
  }
}

# ----------------------------------------------------------`
# EC2
# ----------------------------------------------------------
data "aws_ssm_parameter" "main" {
  name = var.ami_ssm_parameter_name
}

resource "aws_instance" "main" {
  ami                         = data.aws_ssm_parameter.main.value
  instance_type               = var.instance_type
  availability_zone           = var.availability_zone
  subnet_id                   = var.public_subnet_1a_id
  associate_public_ip_address = var.associate_public_ip_address
  key_name                    = aws_key_pair.main.key_name
  vpc_security_group_ids      = var.vpc_security_group_ids
  disable_api_termination     = var.disable_api_termination

  root_block_device {
    volume_type           = "gp3"
    volume_size           = 8
    iops                  = 3000
    delete_on_termination = true
    encrypted             = true

    tags = {
      Name = var.ebs_volume_name
    }
  }

  metadata_options {
    http_tokens = "required"
  }

  lifecycle {
    ignore_changes = [
      ami
    ]
  }

  tags = {
    Name = var.instance_name
  }
}
