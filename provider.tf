terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.67.0"
    }
  }
  /* backend "s3" {
    bucket = "storing-the-backend-data"
    key = "terraform.tfstate"
    dynamodb_table = "lock-state-for-Terraform"
    region = "ap-south-1"
    encrypt = true
  } */
}
terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}

provider "aws" {
  region = "ap-south-1"
}
