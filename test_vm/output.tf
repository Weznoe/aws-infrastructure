output "name" {
  value       = aws_instance.vm.tags["Name"]
  description = "The name of the instance"
}

output "public_ip_address" {
  value       = aws_instance.vm.public_ip
  description = "The public IP address of the vm."
}
