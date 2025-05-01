variable "prefix" {
  type        = string
  description = "The prefix for resource names."
  default     = "default"
}

variable "add_public_ip" {
  type        = bool
  description = "Whether or not a public ip address should associated with this autoscaling group."
  default     = true
}

variable "instance_count_min" {
  description = "Number of instances to provision."
  type        = number
  default     = 1

  validation {
    condition     = var.instance_count_min > 0 && var.instance_count_min <= 3
    error_message = "Instance count min must be between 1 and 3."
  }
}

variable "instance_count_max" {
  description = "Number of instances to provision."
  type        = number
  default     = 2

  validation {
    condition     = var.instance_count_max > 2 && var.instance_count_max <= 10
    error_message = "Instance count max must be between 3 and 10."
  }

  validation {
    condition     = var.instance_count_min < var.instance_count_max
    error_message = "Min count must be less than Max count."
  }
}

variable "image_id" {
  type        = string
  description = "The image to use for the webservers."
}

variable "user_data" {
  type        = string
  description = "The user data for the webservers."
}

variable "instance_type" {
  description = "The size of the VM instances for the webservers."
  type        = string
  default     = "t2.micro"
}


variable "region" {
  type        = string
  description = "The region to create these resources in."
}


variable "security_groups" {
  type        = list(string)
  description = "The ids of security groups to use for each webserver."
}