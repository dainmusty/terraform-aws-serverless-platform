output "primary_acm_certificate_arn" {
  description = "ARN of the ACM certificate"
  value       = module.acm.app_domain_primary_certificate_arn
}

output "secondary_acm_certificate_arn" {
  description = "ARN of the ACM certificate"
  value       = module.acm.app_domain_secondary_certificate_arn
}

output "app_domain_primary_certificate_arn" {
  description = "ARN of the ACM certificate for the primary domain"
  value       = module.acm.app_domain_primary_certificate_arn
}

output "app_domain_secondary_certificate_arn" {
  description = "ARN of the ACM certificate for the secondary domain"
  value       = module.acm.app_domain_secondary_certificate_arn
}

