provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "bucket1" {
  bucket = "microservice-project1"

  tags = {
    Name        = " microservice-project1"
    Environment = "dev"
  }
}

resource "aws_s3_bucket_versioning" "bucket1_versioning" {
  bucket = aws_s3_bucket.bucket1.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket" "bucket2" {
  bucket = "microservice-project2"

  tags = {
    Name        = "microservice-project2"
    Environment = "dev"
  }
}

resource "aws_s3_bucket_versioning" "bucket2_versioning" {
  bucket = aws_s3_bucket.bucket2.id
  versioning_configuration {
    status = "Enabled"
  }
}
