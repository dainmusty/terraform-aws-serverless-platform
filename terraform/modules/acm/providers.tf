# CloudFront requires ACM certs in us-east-1
provider "aws" {
  alias  = "dev_acm"
  region = "us-east-1"
}

