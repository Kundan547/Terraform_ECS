variable "env" {
  description = "Environment name (dev or prod)"
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnet IDs for ECS tasks"
  type        = list(string)
}

variable "security_group_ids" {
  description = "Security Group IDs for ECS tasks"
  type        = list(string)
}

variable "container_image" {
  description = "Docker image for ECS service"
  type        = string
}

variable "container_port" {
  description = "Container port to expose"
  type        = number
  default     = 80
}

variable "cpu" {
  description = "CPU units for the task"
  type        = string
  default     = "256"
}

variable "memory" {
  description = "Memory for the task (MB)"
  type        = string
  default     = "512"
}

variable "desired_count" {
  description = "Number of ECS tasks to run"
  type        = number
  default     = 2
}

variable "target_group_arn" {
  description = "Target group ARN for ALB"
  type        = string
}

variable "alb_listener" {
  description = "ALB listener dependency"
}

variable "environment_variables" {
  description = "Environment variables for the container"
  type        = list(object({
    name  = string
    value = string
  }))
  default = []
}
