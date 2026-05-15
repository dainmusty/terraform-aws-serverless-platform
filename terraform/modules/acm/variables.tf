variable "app_domain_primary" {
  description = "First subdomain (e.g. app.mycoolapp.com)"
  type        = string
}

variable "app_domain_secondary" {
  description = "Second subdomain (e.g. api.mycoolapp.com)"
  type        = string
}

variable "hosted_zone_id" {
  description = "ID of the Route53 hosted zone"
  type        = string
}