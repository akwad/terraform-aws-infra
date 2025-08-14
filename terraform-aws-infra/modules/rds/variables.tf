variable "project" {}
variable "vpc_id" {}
variable "subnets" { type = list(string) }
variable "username" {}
variable "password" { sensitive = true }
