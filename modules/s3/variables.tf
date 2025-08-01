variable "env" {
  description = "Environment name (dev or prod)"
  type        = string
}

variable "bucket_name" {
  description = "Base name for the S3 bucket"
  type        = string
}
