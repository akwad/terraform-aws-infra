resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr
  tags = { Name = "${var.project}-vpc" }
}
output "vpc_id" { value = aws_vpc.this.id }
output "public_subnet_ids" { value = [] }   # add real subnets in production
output "private_subnet_ids" { value = [] }
