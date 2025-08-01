output "bastion_public_ip" {
  description = "Public IP of the Bastion Host"
  value       = aws_instance.bastion.public_ip
}

output "bastion_sg_id" {
  description = "Security Group ID of the Bastion Host"
  value       = aws_security_group.bastion_sg.id
}
