project = "space-invaders"
region  = "us-east-1"

# VM variables
instance_type      = "t2.micro"
instance_count_min = 2
instance_count_max = 6
image_id = {
  us-east-1 = "ami-0be2609ba883822ec",
  us-east-2 = "ami-0a0ad6b70e61be944"
}


# Network variables
vpc_cidr      = "192.168.0.0/16"
subnet_a_cidr = "192.168.1.0/24"
subnet_b_cidr = "192.168.2.0/24"
add_public_ip = true