data "template_file" "task_definition" {
  template = "${file("${path.module}/task-definition.json.tpl")}"

  vars {
    name  = "${local.ecs_name_task_definition}"
    image = "${local.ecr_repo_full}"

    region        = "${local.region}"
    stream_prefix = "${local.project_name}"

    host_port      = "${var.host_port}"
    container_port = "${var.container_port}"
  }
}
