# AWS Region
variable "dev_region" {
  description = "Region"
  type = string
  default = "us-east-1"
}

# VPC Settings
variable "dev_vpc_cidr_block" {
  description = "cidr block value for the Dev-ENV vpc"
  type        = string
  default     = "10.0.0.0/16"
}

variable "dev_vpc_tagname" {
  description = "dev-ENV tag name"
  type        = string
  default     = "dev-vpc"
}

variable "dev_dns_hostnames" {
  description = "dns hostname for 'the DEV-ENV VPC"
  type        = bool
  default     = true
}

variable "dev_dns_support" {
  description = "dns support for dev Dev-ENV VPC"
  type        = bool
  default     = true
}

# Subnet Variables
variable "dev_public_subnet_cidr_block" {
  description = "cidr block for dev-ENV public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "dev_public_subnet_tagname" {
  description = "tagname value for dev-ENV public subnet"
  type        = string
  default     = "dev-public-subnet"
}

# Dev internet gateway
variable "dev_igw_tagname" {
  description = "dev-Env internet gateway tagname"
  type        = string
  default     = "dev-igw"
}

# Dev security group ip
variable "dev_sg_ingress_ips" {
  description = "IP addresses attach to ingress security group"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "dev_sg_egress_ips" {
  description = "IP addresses attach to egress security group"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

# Ec2 instance tagname
variable "dev_ec2_instance_tagname" {
  description = "Dev-ENV Ec2 instance tagname"
  type        = string
  default     = "dev-EC2-node"
}

# EC2 instance type
variable "dev_ec2_instance_type" {
  description = "Name value for the dev-ENV instance type"
  type        = string
  default     = "t2.micro"
}

# Host OS
variable "host_os" {
  description = "the host os running"
  type = string
  default = "windows"
}

# Key_pair public key path with filename
variable "public_key_path_with_filename" {
  description = "The path of the public key including the filename"
  type = string
  default =  "~/.ssh/dev-env-key.pub"
}

# Key_pair private key identity file with filename
variable "private_key_path_with_filename" {
  description = "Identity file to be use in ssh full path and file name"
  type = string
  default =  "~/.ssh/dev-env-key"
}