resource "aws_vpc" "vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc_name
  }
}


resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = var.igw_name
  }
}


# Public Subnet 1
resource "aws_subnet" "public_subnet1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = var.subnet_name1
  }
}


# Public Subnet 2
resource "aws_subnet" "public_subnet2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "ap-south-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = var.subnet_name2
  }
}


# Private Subnet 1
resource "aws_subnet" "private_subnet1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = var.private_subnet_name1
  }
}


# Private Subnet 2
resource "aws_subnet" "private_subnet2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "ap-south-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = var.private_subnet_name2
  }
}


# Public Route Table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = var.rt_name
  }
}


# Public Subnet 1 Route Table Association
resource "aws_route_table_association" "public_rt_association1" {
  route_table_id = aws_route_table.public_rt.id
  subnet_id      = aws_subnet.public_subnet1.id
}


# Public Subnet 2 Route Table Association
resource "aws_route_table_association" "public_rt_association2" {
  route_table_id = aws_route_table.public_rt.id
  subnet_id      = aws_subnet.public_subnet2.id
}


# Private Route Table
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "Private-RT"
  }
}


# Private Subnet 1 Route Table Association
resource "aws_route_table_association" "private_rt_association1" {
  route_table_id = aws_route_table.private_rt.id
  subnet_id      = aws_subnet.private_subnet1.id
}


# Private Subnet 2 Route Table Association
resource "aws_route_table_association" "private_rt_association2" {
  route_table_id = aws_route_table.private_rt.id
  subnet_id      = aws_subnet.private_subnet2.id
}


# Security Group
resource "aws_security_group" "security_group" {
  name        = var.sg_name
  description = "Security group for Jenkins, SonarQube and SSH"
  vpc_id      = aws_vpc.vpc.id

  # SSH
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTPS
  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Jenkins
  ingress {
    description = "Jenkins"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # SonarQube
  ingress {
    description = "SonarQube"
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Prometheus
  ingress {
    description = "Prometheus"
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # MySQL/MariaDB
  ingress {
    description = "MariaDB"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.sg_name
  }
}