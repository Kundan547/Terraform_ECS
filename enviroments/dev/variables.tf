variable "env" {
  type        = string
  description = "Environment (dev or prod)"
}

variable "db_name" {
  type        = string
  description = "Aurora DB name"
}

variable "db_username" {
  type        = string
  description = "Aurora DB username"
}

variable "db_password" {
  type        = string
  description = "Aurora DB password"
  sensitive   = true
}

variable "prod_domain" {
  type        = string
  description = "Production domain"
}

variable "dev_domain" {
  type        = string
  description = "Development domain"
}

variable "hosted_zone_id" {
  type        = string
  description = "Hosted Zone ID"
}

variable "bastion_ami_id" {
  description = "AMI ID for the Bastion host"
  type        = string
}
variable "account_id" {
  description = "AWS Account ID for GitHub OIDC Role"
  type        = string
}

variable "github_repo" {
  description = "GitHub repository in format owner/repo"
  type        = string
}

