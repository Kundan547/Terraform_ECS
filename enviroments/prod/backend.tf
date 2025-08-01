terraform {
  backend "s3" {
    bucket = "prod-terraform-state-bucket-435354565011"
    key    = "prod/terraform.tfstate"
    region = "us-east-1"
  }
}
