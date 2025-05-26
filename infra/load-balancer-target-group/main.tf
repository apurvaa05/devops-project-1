resource "aws_lb_target_group" "dev_proj_1_lb_target_group" {
  name     = var.lb_target_group_name
  port     = var.lb_target_group_port
  protocol = var.lb_target_group_protocol
  vpc_id   = var.vpc_id
  target_type = "instance"

  # Health check parameters (as arguments, not a block!)
  health_check_enabled             = true
  health_check_protocol            = "HTTP"
  health_check_path                = "/"
  health_check_interval            = 30
  health_check_timeout             = 5
  healthy_threshold                = 5
  unhealthy_threshold              = 2
  matcher                          = "200"

  stickiness {
    type            = "lb_cookie"
    enabled         = false
  }
}

resource "aws_lb_target_group_attachment" "dev_proj_1_lb_target_group_attachment" {
  target_group_arn = aws_lb_target_group.dev_proj_1_lb_target_group.arn
  target_id        = var.ec2_instance_id
  port             = 5000
}

output "dev_proj_1_lb_target_group_arn" {
  value = aws_lb_target_group.dev_proj_1_lb_target_group.arn
}
