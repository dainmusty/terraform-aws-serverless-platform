output "primary_cf_domain"         { value = aws_cloudfront_distribution.primary.domain_name }
# output "secondary_cf_domain"       { value = aws_cloudfront_distribution.secondary.domain_name }
output "primary_cf_distribution_id" { value = aws_cloudfront_distribution.primary.id }
# output "secondary_cf_distribution_id" { value = aws_cloudfront_distribution.secondary.id }

output "primary_cf_hosted_zone_id" {
  value = aws_cloudfront_distribution.primary.hosted_zone_id
}

# output "secondary_cf_hosted_zone_id" {
#   value = aws_cloudfront_distribution.secondary.hosted_zone_id    
# }