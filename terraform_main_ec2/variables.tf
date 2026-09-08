variable "region" {
  default = "ap-south-1"
}

variable "vpc_name" {
  default = "Jumphost-vpc"
}

variable "igw_name" {
  default = "Jumphost-igw"
}

variable "subnet_name1" {
  default = "Public-Subnet-1"
}

variable "subnet_name2" {
  default = "Public-Subnet-2"
}

variable "private_subnet_name1" {
  default = "Private-Subnet-1"
}

variable "private_subnet_name2" {
  default = "Private-Subnet-2"
}

variable "rt_name" {
  default = "Jumphost-rt"
}

variable "sg_name" {
  default = "Jumphost-sg"
}

variable "iam_role" {
  default = "Jumphost-iam-role1"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "key_name" {
  default = "server"
}

variable "instance_name" {
  default = "Jumphost-server"
}