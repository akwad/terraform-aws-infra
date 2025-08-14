resource "aws_db_subnet_group" "this" {
  name       = "${var.project}-db-subnets"
  subnet_ids = var.subnets
}
resource "aws_db_instance" "this" {
  identifier = "${var.project}-pg"
  engine = "postgres"
  instance_class = "db.t3.micro"
  username = var.username
  password = var.password
  db_subnet_group_name = aws_db_subnet_group.this.name
  skip_final_snapshot = true
}
