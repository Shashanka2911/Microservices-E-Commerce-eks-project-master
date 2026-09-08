terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.25.0"
    }
  }

  backend "s3" {
    bucket = "microservice-project1" # Changed to all lowercase
    key    = "k8/terraform.tfstate"
    region = "ap-south-1"
  }

  required_version = ">= 1.6.3"
}