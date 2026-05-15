variable "log_bucket_name" {
  description = "Existing S3 bucket for CloudFront logs"
  type        = string
  default     = ""
  
}

variable "enable_ipv6" {
  description = "Enable IPv6 on CloudFront and AAAA records"
  type        = bool
  default     = true
}

variable "domain_name_source" {
  description = "Name of source of traffic" # ALB DNS name or S3 bucket for static site or API Gateway domain name
  type = string
}

variable "region" {
  description = "AWS region for your EKS/ALB"
  type        = string
   
}

variable "app_domain_primary" {
  description = "First subdomain (e.g. app.mycoolapp.com)"
  type        = string
}

variable "enable_cf_logging" {
  description = "Enable CloudFront standard logs to S3"
  type        = bool
   
}

variable "acm_certificate_validation_primary_certificate_arn" {
  description = "ACM certificate ARN for primary CloudFront distribution"
  type = string
}

# variable "acm_certificate_validation_secondary_certificate_arn" {
#   description = "ACM certificate ARN for secondary CloudFront distribution"
#   type = string
# }

# variable "app_domain_secondary" {
#   description = "Second subdomain (e.g. api.mycoolapp.com)"
#   type        = string
# }






