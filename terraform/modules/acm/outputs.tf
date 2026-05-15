output "primary_acm_certificate_arn" {
  description = "ARN of the ACM certificate"
  value       = aws_acm_certificate.primary.arn
}

output "secondary_acm_certificate_arn" {
  description = "ARN of the ACM certificate"
  value       = aws_acm_certificate.secondary.arn
}

output "app_domain_primary_certificate_arn" {
  description = "ARN of the ACM certificate for the primary domain"
  value       = aws_acm_certificate.primary.arn
}

output "app_domain_secondary_certificate_arn" {
  description = "ARN of the ACM certificate for the secondary domain"
  value       = aws_acm_certificate.secondary.arn
}

