variable "vpc_cidr" {}
variable "project" {}
variable "region" {}
variable "public_subnets" { type = list(string) }
variable "private_subnets" { type = list(string) }
