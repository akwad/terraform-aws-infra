terraform {
  backend "s3" {
    bucket         = "akwad-terraform-backend"
    key            = "terraform/aws-infra/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "akwad-terraform-lock"
    encrypt        = true
  }
  required_providers {
    aws = { source = "hashicorp/aws", version = "~> 5.0" }
  }
  required_version = ">= 1.6.0"
}
