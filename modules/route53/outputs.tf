output "dev_record_fqdn" {
  description = "Fully qualified domain name for dev"
  value       = aws_route53_record.dev.fqdn
}

output "prod_record_fqdn" {
  description = "Fully qualified domain name for prod"
  value       = aws_route53_record.prod.fqdn
}
