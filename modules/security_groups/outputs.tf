output "alb_sg_id" {
  description = "ALB Security Group ID"
  value       = aws_security_group.alb_sg.id
}

output "ecs_sg_id" {
  description = "ECS Security Group ID"
  value       = aws_security_group.ecs_sg.id
}

output "bastion_sg_id" {
  description = "Bastion Security Group ID"
  value       = aws_security_group.bastion_sg.id
}

output "rds_sg_id" {
  description = "Aurora DB Security Group ID"
  value       = aws_security_group.aurora_sg.id  # ✅ Use aurora_sg instead of missing rds_sg
}
