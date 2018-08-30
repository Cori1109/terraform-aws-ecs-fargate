variable "project_name" {
  description = "Name for the project"
  default     = ""
}

variable "ecr_repo" {
  description = "TODO"
  default     = ""
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
