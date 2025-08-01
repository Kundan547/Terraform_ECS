variable "env" {
  description = "Environment name (dev or prod)"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "ecs_port" {
  description = "Port ECS is running on"
  type        = number
  default     = 80
}

variable "allowed_ip" {
  description = "Your IP for SSH access"
  type        = string
}

