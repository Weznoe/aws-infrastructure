output "dns_name" {
    description = "The DNS name of the load balancer"
    value = aws_elb.elb.dns_name
}