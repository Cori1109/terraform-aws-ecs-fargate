locals {
  path_root_list = "${split("/", path.root)}"
  path_root_len  = "${length(local.path_root_list)}"
  parent_dir     = "${element(local.path_root_list, local.path_root_len - 1)}"

  region     = "${data.aws_region.0.name}"
  account_id = "${data.aws_caller_identity.0.account_id}"
}

locals {
  project_name = "${var.project_name != "" ? var.project_name : local.parent_dir}"

  ecr_repo      = "${var.ecr_repo != "" ? var.ecr_repo : local.project_name}"
  ecr_repo_full = "${local.account_id}.dkr.ecr.${local.region}.amazonaws.com/${local.ecr_repo}"

  ecs_name_cluster         = "${local.project_name}"
  ecs_name_service         = "${local.project_name}"
  ecs_name_task_definition = "${local.project_name}"
  ecs_iam_role_name        = "${local.project_name}-ecs"
  ecs_role_arn             = "${var.ecs_role_arn != "" ? var.ecs_role_arn : "arn:aws:iam::${local.account_id}:role/${local.ecs_iam_role_name}"}" //"
}
