resource "aws_security_group" "alb_ecs" {
  name        = "${local.project_name}-alb-ecs"
  description = "Allow access between ALB & ECS"
  vpc_id      = "${var.vpc_id}"

  ingress {
    protocol        = "tcp"
    from_port       = "${var.container_port}"
    to_port         = "${var.container_port}"
    security_groups = ["${var.security_groups}"]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  count = "${local.alb_count}"
}
