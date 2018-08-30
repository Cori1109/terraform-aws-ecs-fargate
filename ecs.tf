resource "aws_ecs_cluster" "0" {
  name = "${local.ecs_name_cluster}"
}

resource "aws_ecs_task_definition" "0" {
  family                   = "${local.ecs_name_task_definition}"
  container_definitions    = "${data.template_file.task_definition.rendered}"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "${var.ecs_cpu}"
  memory                   = "${var.ecs_memory}"
  network_mode             = "awsvpc"

  task_role_arn      = "${local.ecs_role_arn}"
  execution_role_arn = "${local.ecs_role_arn}"
}

resource "aws_ecs_service" "0" {
  name            = "${local.ecs_name_service}"
  cluster         = "${aws_ecs_cluster.0.id}"
  task_definition = "${aws_ecs_task_definition.0.arn}"
  launch_type     = "FARGATE"

  desired_count                      = 0
  deployment_minimum_healthy_percent = 0

  network_configuration {
    security_groups  = ["${aws_security_group.alb_ecs.id}"]
    subnets          = ["${var.subnets}"]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = "${aws_alb_target_group.0.arn}"
    container_name   = "${local.ecs_name_task_definition}"
    container_port   = "${var.container_port}"
  }

  depends_on = [
    "aws_alb_listener.0",
  ]
}
