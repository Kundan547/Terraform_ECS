variable "env" {
  description = "Environment name (dev or prod)"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for Aurora DB"
  type        = string
}

variable "private_subnet_ids" {
  description = "Private Subnet IDs for Aurora DB"
  type        = list(string)
}

variable "ecs_sg_ids" {
  description = "Security Group IDs for ECS to connect to Aurora"
  type        = list(string)
}

variable "bastion_sg_id" {
  description = "Security Group ID of Bastion Host"
  type        = string
}

variable "db_name" {
  description = "Database name for Aurora PostgreSQL"
  type        = string
}

variable "db_username" {
  description = "Master username for Aurora PostgreSQL"
  type        = string
}

variable "db_password" {
  description = "Master password for Aurora PostgreSQL"
  type        = string
  sensitive   = true
}

variable "engine_version" {
  description = "Aurora PostgreSQL engine version"
  type        = string
  default     = "15.4"
}

variable "instance_class" {
  description = "Aurora instance class"
  type        = string
  default     = "db.r6g.large"
}

variable "skip_final_snapshot" {
  description = "Skip final snapshot before cluster deletion"
  type        = bool
  default     = true
}
