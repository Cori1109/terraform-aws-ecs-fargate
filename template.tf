data "template_file" "task_definition" {
  template = "${file("${path.module}/task-definition.json.tpl")}"

  vars {
    name  = "${local.ecs_name_task_definition}"
    image = "${local.ecr_repo_full}"

    region        = "${local.region}"
    stream_prefix = "${local.project_name}"

    container_port = "${var.container_port}"

    ecs_cpu    = "${var.ecs_cpu}"
    ecs_memory = "${var.ecs_memory}"
  }
}
