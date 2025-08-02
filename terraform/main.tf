provider "aws" {
  region = var.aws_region
}

resource "aws_ecr_repository" "ec2demo" {
  name                 = "ec2demo"
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

backend "s3" {
}