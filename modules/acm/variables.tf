variable "env" {
  description = "Environment (prod)"
  type        = string
}

variable "prod_domain" {
  description = "Production domain"
  type        = string
}

variable "dev_domain" {
  description = "Development subdomain"
  type        = string
}

variable "hosted_zone_id" {
  description = "Route 53 Hosted Zone ID"
  type        = string
}
