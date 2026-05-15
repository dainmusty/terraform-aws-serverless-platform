
# This file defines the ACM module, which creates SSL certificates for the specified subdomains. The certificates are required for CloudFront distributions to serve content over HTTPS. The ACM module is configured to use the hosted zone created in the hosted-zone.tf file to validate the domain ownership.
module "acm" {
  source = "../modules/acm"
  
  # Two subdomains (will map to two CloudFront distributions)
  app_domain_primary   = "app.company-domain-name.com"
  app_domain_secondary = "api.company-domain-name.com"

  hosted_zone_id = module.hosted_zone.hosted_zone_id

}
