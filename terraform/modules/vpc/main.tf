# ----------------------------------------------------------
# VPC
# ----------------------------------------------------------
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  tags = {
    Name = var.vpc_name
  }
}

# ----------------------------------------------------------
# Subnet
# ----------------------------------------------------------
resource "aws_subnet" "public_1a" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.public_subnet_1a_cidr_block
  availability_zone = "ap-northeast-1a"
  tags = {
    Name = var.public_subnet_1a_name
  }
}

resource "aws_subnet" "public_1c" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.public_subnet_1c_cidr_block
  availability_zone = "ap-northeast-1c"
  tags = {
    Name = var.public_subnet_1c_name
  }
}

resource "aws_subnet" "private_1a" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_subnet_1a_cidr_block
  availability_zone = "ap-northeast-1a"
  tags = {
    Name = var.private_subnet_1a_name
  }
}

resource "aws_subnet" "private_1c" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_subnet_1c_cidr_block
  availability_zone = "ap-northeast-1c"
  tags = {
    Name = var.private_subnet_1c_name
  }
}

resource "aws_subnet" "private_1d" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_subnet_1d_cidr_block
  availability_zone = "ap-northeast-1d"
  tags = {
    Name = var.private_subnet_1d_name
  }
}

# ----------------------------------------------------------
# Internet Gateway
# ----------------------------------------------------------
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = var.internet_gateway_name
  }
}

# ----------------------------------------------------------
# Route Table
# ----------------------------------------------------------
resource "aws_route_table" "public_1a" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
}

resource "aws_route_table_association" "public_1a" {
  subnet_id      = aws_subnet.public_1a.id
  route_table_id = aws_route_table.public_1a.id
}

# ----------------------------------------------------------
# Security Group
# ----------------------------------------------------------
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "SSH to public subnet"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allow_ssh_cidr_blocks
  }

  egress {
    description = "Allow trafic by EC2"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "rds" {
  name        = "rds"
  description = "Allow access to RDS"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "Access to RDS"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [aws_subnet.public_1a.cidr_block, aws_subnet.private_1d.cidr_block]
  }

  egress {
    description = "Allow trafic by RDS"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "lambda" {
  name        = "lambda"
  description = "Allow trafic by lambda"
  vpc_id      = aws_vpc.vpc.id
  egress {
    description = "Allow trafic by lambda"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "elasticache" {
  name        = "elasticache"
  description = "Allow access to Elasticache"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "Access to Elasticache"
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = [aws_subnet.public_1a.cidr_block, aws_subnet.private_1d.cidr_block]
  }

  egress {
    description = "Allow trafic by Elasticache"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
