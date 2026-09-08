# ============================================================
# Dynamically fetch the latest Ubuntu 22.04 LTS AMI
# ============================================================
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical's official AWS Account ID

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# ============================================================
# EC2 Instance
# ============================================================
resource "aws_instance" "ec2" {
  ami                    = data.aws_ami.ubuntu.id 
  instance_type          = "t3.micro"  # <--- I have hardcoded the Free Tier size here
  key_name               = var.key_name
  subnet_id              = aws_subnet.public_subnet1.id
  vpc_security_group_ids = [aws_security_group.security_group.id]

  iam_instance_profile = aws_iam_instance_profile.instance_profile.name

  root_block_device {
    volume_size           = 30
    volume_type           = "gp3"
    encrypted             = true
    delete_on_termination = true
  }

  user_data = file("${path.module}/install-tools.sh")

  # Force Terraform to wait for IAM propagation
  depends_on = [
    aws_iam_instance_profile.instance_profile,
    aws_subnet.public_subnet1
  ]

  tags = {
    Name        = var.instance_name
    Environment = "dev"
    Project     = "Microservices-E-Commerce"
  }
}