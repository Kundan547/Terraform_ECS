variable "env" {
  description = "Environment name (dev or prod)"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where Bastion Host will be deployed"
  type        = string
}

variable "public_subnet_id" {
  description = "Public subnet ID for Bastion Host"
  type        = string
}

variable "key_name" {
  description = "Key pair name for SSH access"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for Bastion Host"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for Bastion Host"
  type        = string
  default     = "t3.micro"
}

variable "rds_sg_id" {
  description = "Security Group ID of RDS (to allow Bastion access)"
  type        = string
}
