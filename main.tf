# Provider Block
provider "aws" {
  profile = "default"
  region  = var.dev_region
}

# Resources Block

# VPC
resource "aws_vpc" "dev_vpc" {
  cidr_block           = var.dev_vpc_cidr_block
  enable_dns_hostnames = var.dev_dns_hostnames
  enable_dns_support   = var.dev_dns_support
  tags = {
    Name = var.dev_vpc_tagname
  }

}

# subnet
resource "aws_subnet" "dev_public_subnet" {
  vpc_id                  = aws_vpc.dev_vpc.id
  cidr_block              = var.dev_public_subnet_cidr_block
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Name = var.dev_public_subnet_tagname
  }
}

# internet gatway
resource "aws_internet_gateway" "dev_igw" {
  vpc_id = aws_vpc.dev_vpc.id

  tags = {
    Name = var.dev_igw_tagname
  }
}

# route table
resource "aws_route_table" "dev_route_table" {
  vpc_id = aws_vpc.dev_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev_igw.id
  }

  tags = {
    Name = "dev-route-table"
  }
}

resource "aws_route_table_association" "dev_associate" {
  route_table_id = aws_route_table.dev_route_table.id
  subnet_id      = aws_subnet.dev_public_subnet.id
}

# security groups
resource "aws_security_group" "dev_security_group" {
  description = "security group of the dev"
  vpc_id      = aws_vpc.dev_vpc.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.dev_sg_ingress_ips
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.dev_sg_egress_ips
  }

  tags = {
    Name = "dev-security-group"
  }
}

# Ec2 key pairs
resource "aws_key_pair" "dev_key_pair" {
  key_name   = "dev-public-key-pair"
  public_key = file(var.public_key_path_with_filename)
}

# Ec2 instance
resource "aws_instance" "dev_ec2_node" {
  ami                    = data.aws_ami.node_os.image_id
  instance_type          = var.dev_ec2_instance_type
  subnet_id              = aws_subnet.dev_public_subnet.id
  vpc_security_group_ids = [aws_security_group.dev_security_group.id]
  key_name               = aws_key_pair.dev_key_pair.id
  user_data              = file("user_data.tpl")

  root_block_device {
    volume_size = 10
  }

  provisioner "local-exec" {
  command = templatefile("${var.host_os}_ssh_config.tpl", {
    hostname = self.public_ip,
    user = "ubuntu",
    identityfile = var.private_key_path_with_filename
  })

  interpreter = var.host_os == "windows" ? ["powershell", "-Command"] : ["bash", "-c"]
}


  tags = {
    Name = var.dev_ec2_instance_tagname
  }

}