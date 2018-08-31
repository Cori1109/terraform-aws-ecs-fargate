output "ecs_name_cluster" {
  value = "${local.ecs_name_cluster}"
}

output "ecs_name_service" {
  value = "${local.ecs_name_service}"
}

output "ecs_name_task_definition" {
  value = "${local.ecs_name_task_definition}"
}

output "alb_dns" {
  value = "${aws_alb.0.*.dns_name}"
}
