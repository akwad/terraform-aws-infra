variable "region" { type = string, default = "us-east-1" }
variable "project" { type = string, default = "akwad-infra" }
variable "vpc_cidr" { type = string, default = "10.0.0.0/16" }
variable "public_subnets"  { type = list(string), default = ["10.0.1.0/24","10.0.2.0/24","10.0.3.0/24"] }
variable "private_subnets" { type = list(string), default = ["10.0.11.0/24","10.0.12.0/24","10.0.13.0/24"] }
variable "db_username" { type = string, default = "postgres" }
variable "db_password" { type = string, sensitive = true }
