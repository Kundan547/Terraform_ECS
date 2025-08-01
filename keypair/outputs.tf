output "key_name" {
  description = "Name of the created key pair"
  value       = aws_key_pair.bastion_key.key_name
}
