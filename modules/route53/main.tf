resource "aws_route53_record" "dev" {
  zone_id = var.hosted_zone_id
  name    = var.dev_domain
  type    = "A"

  alias {
    name                   = var.alb_dns_name
    zone_id                = var.alb_zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "prod" {
  zone_id = var.hosted_zone_id
  name    = var.prod_domain
  type    = "A"

  alias {
    name                   = var.alb_dns_name
    zone_id                = var.alb_zone_id
    evaluate_target_health = true
  }
}
