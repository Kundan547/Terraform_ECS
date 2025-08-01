resource "aws_ecr_repository" "repo" {
  name                 = var.repo_name
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "AES256"
  }

  tags = {
    Name        = "${var.env}-ecr-${var.repo_name}"
    Environment = var.env
  }
}
