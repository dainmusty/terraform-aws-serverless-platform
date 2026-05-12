# Output definitions for dev environment
output "api_gateway_endpoint" {
  value = module.api_gateway.api_gateway_endpoint
}

# output "amplify_app_url" {
#   value = module.amplify.amplify_app_url
# }

output "amplify_default_domain" {
  value = module.amplify.amplify_default_domain
}

output "get_student_api_url" {

  value = "${module.api_gateway.api_gateway_endpoint}/getStudent"
}

output "post_student_api_url" {

  value = "${module.api_gateway.api_gateway_endpoint}/addStudent"
}