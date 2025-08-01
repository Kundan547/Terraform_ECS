variable "dev_domain" {
  description = "Development domain name"
  type        = string
}

variable "prod_domain" {
  description = "Production domain name"
  type        = string
}

variable "hosted_zone_id" {
  description = "Route53 Hosted Zone ID"
  type        = string
}

variable "alb_dns_name" {
  description = "DNS name of ALB"
  type        = string
}

variable "alb_zone_id" {
  description = "Zone ID of ALB"
  type        = string
}
