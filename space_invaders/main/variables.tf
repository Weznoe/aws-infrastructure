variable "region" {
  type = string
}

variable "image_id" {
  description = "The id of the machine image (AMI) to use for the server."
  type        = map(string)
}
variable "add_public_ip" {
  type    = bool
  default = true
}

variable "project" {
  description = "The name of the current project."
  type        = string
}

variable "vpc_cidr" {
  type = string
}

variable "subnet_a_cidr" {
  type = string
}

variable "subnet_b_cidr" {
  type = string
}

variable "instance_count_min" {
  description = "Number of instances to provision."
  type        = number
}

variable "instance_count_max" {
  description = "Number of instances to provision."
  type        = number
}


variable "instance_type" {
  description = "The size of the VM instances for the webservers."
  type        = string
}

