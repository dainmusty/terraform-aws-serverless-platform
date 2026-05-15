

variable "cloudfront_distribution_primary_domain_name" {
  description = "cloudfront distribution domain name"
  type = string
}

variable "hosted_zone_id" {
  description = "Route53 hosted zone ID"
  type = string
}

variable "cloudfront_distribution_primary_hosted_zone_id" {
  description = "cloudfront distribution hosted zone ID"
  type = string
}


variable "app_domain_primary" {
  description = "First subdomain (e.g. app.mycoolapp.com)"
  type        = string
}

variable "enable_ipv6" {
  description = "Enable IPv6 on CloudFront and AAAA records"
  type        = bool
   
}


# variable "app_domain_secondary" {
#   description = "Second subdomain (e.g. api.mycoolapp.com)"
#   type        = string
# }
  