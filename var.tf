variable "project_name" {
  description = "Name for the project"
  default     = ""
}

variable "ecr_repo" {
  description = "Only the docker (ECR) repo name in your region/account"
  default     = ""
}

variable "ecr_repo_tag" {
  description = "Docker image tag in ECR"
  default     = "latest"
}

variable "security_groups" {
  type        = "list"
  description = "Security group IDs to run ECS within"
}

variable "subnets" {
  type        = "list"
  description = "Subnets for ECS to run within"
}

variable "ecs_cpu" {
  description = "Amount of CPU for the container"
  default     = "1024"
}

variable "ecs_memory" {
  description = "Amount of Memory for the container"
  default     = "2048"
}

variable "ecs_role_arn" {
  description = "Override default ecs role"
  default     = ""
}

variable "alb_listen_port" {
  description = "Port for ALB to listen on"
  default     = 80
}

variable "vpc_id" {
  description = "VPC ID for ALB"
}

variable "container_port" {
  description = "ECS port on the container"
}

variable "create_log_group" {
  description = "Create /aws/ecs log group"
  default     = true
}

variable "desired_count" {
  description = "Desired running containers count"
  default     = 1
}

variable "deployment_minimum_healthy_percent" {
  description = "Minimum healthy percent for ECS"
  default     = 0
}

variable "env_keys" {
  description = "Keys for env vars"
  default     = []
}

variable "env_vals" {
  description = "Vals for env vars"
  default     = []
}

variable "health_check_path" {
  description = ""
  default     = "/"
}

variable "include_alb" {
  description = ""
  default     = true
}
