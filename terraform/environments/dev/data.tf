# data "terraform_remote_state" "shared" {
#   backend = "s3"

#   config = {
#     bucket = "mustydain"
#     key    = "shared/terraform.tfstate"
#     region = "us-east-1"
#   }
# }
