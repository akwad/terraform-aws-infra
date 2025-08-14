resource "aws_lb" "this" {
  name = "${var.project}-alb"
  load_balancer_type = "application"
  subnets = var.subnets
}
output "alb_arn" { value = aws_lb.this.arn }
