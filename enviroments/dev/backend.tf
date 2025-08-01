terraform {
  backend "s3" {
    bucket = "terraform-state-dev-035533758102-us-east-1"
    key    = "staging/terraform.tfstate"  # or "production/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}
