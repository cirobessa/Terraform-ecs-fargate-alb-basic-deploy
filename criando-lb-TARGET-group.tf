resource "aws_lb_target_group" "target_group" {
  name        = var.proj-nome
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = aws_default_vpc.default_vpc.id # Referenciando a default VPC
 health_check  {
    healthy_threshold = 3
    unhealthy_threshold = 3
    timeout = 5
    interval = 30
    matcher = "200-499"
    path = "/"
  }
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_alb.application_load_balancer.arn # Referenciando Nosso load balance
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn #  target group
  }
}
