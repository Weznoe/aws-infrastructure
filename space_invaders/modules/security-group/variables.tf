variable "ingress_port" {
  type        = number
  description = "The ingress port to allow."
}

variable "description" {
  type        = string
  description = "Description of the security group."
}

variable "name" {
  type        = string
  description = "Name of the security group."
}

variable "vpc_id" {
  type        = string
  description = "The id of the VPC to associate this security group with."
}