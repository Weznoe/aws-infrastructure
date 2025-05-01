variable "prefix" {
  type        = string
  description = "Prefix used for all resource names."
}

variable "security_groups" {
  type        = list(string)
  description = "List of security group ids to apply to this load balancer"
}

variable "subnets" {
  type        = list(string)
  description = "List of subnet ids to deploy webservers in"
}
