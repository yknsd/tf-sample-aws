output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.private[*].id
}

output "security_group_ec2_id" {
  value = aws_security_group.ec2.id
}

output "security_group_efs_id" {
  value = aws_security_group.efs.id
}

output "security_group_alb_id" {
  value = aws_security_group.alb.id
}
