resource "aws_alb" "0" {
  name = "${local.project_name}"

  security_groups = ["${var.security_groups}"]
  subnets         = ["${var.subnets}"]
}

resource "aws_alb_target_group" "0" {
  name = "${local.project_name}"

  port     = "${var.container_port}"
  protocol = "HTTP"
  vpc_id   = "${var.vpc_id}"
}

resource "aws_alb_listener" "0" {
  load_balancer_arn = "${aws_alb.0.id}"
  port              = "${var.alb_listen_port}"
  protocol          = "HTTP"

  default_action {
    target_group_arn = "${aws_alb_target_group.0.id}"
    type             = "forward"
  }
}
