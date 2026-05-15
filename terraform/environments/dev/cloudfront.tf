# module "cloudfront" {
#   source = "../../modules/cloudfront"

#   region = "us-east-1"

#   log_bucket_name = module.s3.log_bucket_name

#   domain_name_source = module.amplify.amplify_default_domain # Uncomment this line to use Amplify default domain for CloudFront distribution

#   app_domain_primary   = data.terraform_remote_state.shared.outputs.app_domain_primary_certificate_arn
#   # app_domain_secondary = data.terraform_remote_state.shared.outputs.app_domain_secondary_certificate_arn

#   acm_certificate_validation_primary_certificate_arn = data.terraform_remote_state.shared.outputs.primary_acm_certificate_arn

#   # acm_certificate_validation_secondary_certificate_arn = data.terraform_remote_state.shared.outputs.secondary_acm_certificate_arn

#   enable_ipv6      = true
#   enable_cf_logging = true
# }

