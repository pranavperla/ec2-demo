provider "aws" {
  region = var.aws_region
}

resource "aws_ecr_repository" "ec2demo-frontend" {
  name                 = "ec2demo-frontend"
  image_tag_mutability = "MUTABLE"

  lifecycle {
    prevent_destroy = false
  }

  encryption_configuration {
    encryption_type = "AES256"
  }
}

resource "aws_ecr_repository" "ec2demo-backend" {
  name                 = "ec2demo-backend"
  image_tag_mutability = "MUTABLE"

  lifecycle {
    prevent_destroy = false
  }

  encryption_configuration {
    encryption_type = "AES256"
  }
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

terraform {
  backend "s3" {}
}