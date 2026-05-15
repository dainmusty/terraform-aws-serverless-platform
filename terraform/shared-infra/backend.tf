terraform {
  backend "s3" {
    bucket  = "dev-terraform-state-bucket" # S3 bucket name
    key     = "shared/terraform.tfstate" # Path within the bucket
    region  = "us-east-1"
    encrypt = true
    #use_lockfile = true
    # Native s3 locking!
  }
}
