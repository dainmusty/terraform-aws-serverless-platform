output "hosted_zone_id" {
    description = "Route53 hosted zone ID"
    value       = aws_route53_zone.dev_hosted_zone.zone_id
  
}