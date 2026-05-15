# (A/AAAA aliases → each CF distribution)

resource "aws_route53_record" "primary_a" {
  zone_id = var.hosted_zone_id

  name = var.app_domain_primary
  type = "A"

  alias {
    name                   = var.cloudfront_distribution_primary_domain_name
    zone_id                = var.cloudfront_distribution_primary_hosted_zone_id
    evaluate_target_health = false
  }
}


resource "aws_route53_record" "primary_aaaa" {
  count   = var.enable_ipv6 ? 1 : 0
  zone_id = var.hosted_zone_id

  name = var.app_domain_primary
  type = "AAAA"

  alias {
    name                   = var.cloudfront_distribution_primary_domain_name
    zone_id                = var.cloudfront_distribution_primary_hosted_zone_id
    evaluate_target_health = false
  }
}



# # Note: For a serverless application, you typically only need one CloudFront distribution (e.g., for the frontend). If you have a separate API domain, you can create a second distribution as shown below. Just ensure your DNS and ACM certificates are set up accordingly.
# resource "aws_route53_record" "secondary_a" {
#   zone_id = aws_route53_zone.dev_hosted_zone.zone_id
#   name    = var.app_domain_secondary
#   type    = "A"
#   alias {
#     name                   = var.cloudfront_distribution_secondary_domain_name
#     zone_id                = var.cloudfront_distribution_secondary_hosted_zone_id
#     evaluate_target_health = false
#   }
# }

# resource "aws_route53_record" "secondary_aaaa" {
#   count  = var.enable_ipv6 ? 1 : 0
#   zone_id = aws_route53_zone.dev_hosted_zone.zone_id
#   name    = var.app_domain_secondary
#   type    = "AAAA"  
#   alias {
#     name                   = var.cloudfront_distribution_secondary_domain_name
#     zone_id                = var.cloudfront_distribution_secondary_hosted_zone_id
#     evaluate_target_health = false
#   }
# }
