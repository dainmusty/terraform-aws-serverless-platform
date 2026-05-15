# module "dns" {
#   source = "../../modules/dns"

#   hosted_zone_id = data.terraform_remote_state.shared.outputs.hosted_zone_id
#   app_domain_primary = module.cloudfront.primary_cf_domain
#   cloudfront_distribution_primary_domain_name = module.cloudfront.primary_cf_domain
#   cloudfront_distribution_primary_hosted_zone_id = module.cloudfront.primary_cf_hosted_zone_id
#   enable_ipv6 = true

# }