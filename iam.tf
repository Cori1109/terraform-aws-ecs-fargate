resource "aws_iam_role" "ecs" {
  name               = "${local.ecs_iam_role_name}"
  assume_role_policy = "${file("${path.module}/role-ecs.json")}"
}

resource "aws_iam_role_policy" "ecs" {
  role   = "${aws_iam_role.ecs.name}"
  policy = "${file("${path.module}/policy-ecs.json")}"
}
