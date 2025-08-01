output "github_actions_role_name" {
  description = "The name of the IAM Role for GitHub Actions OIDC"
  value       = aws_iam_role.github_actions_role.name
}

