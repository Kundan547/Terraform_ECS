variable "env" {
  description = "Environment name (dev or prod)"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where ALB is deployed"
  type        = string
}

variable "public_subnet_ids" {
  description = "Public subnet IDs for ALB"
  type        = list(string)
}

variable "target_port" {
  description = "Port for ECS target group"
  type        = number
  default     = 80
}

variable "health_check_path" {
  description = "Health check path for ECS service"
  type        = string
  default     = "/"
}

variable "acm_certificate_arn" {
  description = "ACM certificate ARN for HTTPS"
  type        = string
}
