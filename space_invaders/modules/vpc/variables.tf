variable "prefix" {
  description = "The prefix used for resource names."
  type        = string
}

variable "vpc_cidr" {
  type = string
}

variable "region" {
  type        = string
  description = "The region to deploy resources in."
}

variable "subnets" {
  type = list(object({
    zone : string,
    cidr_block : string,
  }))
  description = "A list of subnet configs."
}