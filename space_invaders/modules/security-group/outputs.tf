output "sg_id" {
  description = "The id of the created security group."
  value       = aws_security_group.sg.id
}