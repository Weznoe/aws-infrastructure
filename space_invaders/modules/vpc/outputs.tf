output "subnets" {
  description = "The ids of subnets created in the VPC"
  value       = [for subnet in aws_subnet.subnets: subnet.id]
}
output "vpc_id" {
  description = "The id of the VPC"
  value       = aws_vpc.vpc.id
}