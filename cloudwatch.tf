resource "aws_cloudwatch_log_group" "ecs" {
  name = "/aws/ecs"

  count = "${local.log_group_count}"
}
