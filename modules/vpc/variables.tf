variable "env" {
  description = "Environment name (dev or prod)"
  type        = string
}

variable "cidr_block" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_a_cidr" {
  description = "CIDR for Public Subnet A"
  type        = string
  default     = "10.0.1.0/24"
}

variable "public_subnet_b_cidr" {
  description = "CIDR for Public Subnet B"
  type        = string
  default     = "10.0.2.0/24"
}

variable "private_subnet_a_cidr" {
  description = "CIDR for Private Subnet A"
  type        = string
  default     = "10.0.3.0/24"
}

variable "private_subnet_b_cidr" {
  description = "CIDR for Private Subnet B"
  type        = string
  default     = "10.0.4.0/24"
}

variable "az_a" {
  description = "Availability Zone A"
  type        = string
  default     = "us-east-1a"
}

variable "az_b" {
  description = "Availability Zone B"
  type        = string
  default     = "us-east-1b"
}
