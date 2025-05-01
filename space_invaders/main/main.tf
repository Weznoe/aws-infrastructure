
module "autoscaling-group" {
  source             = "../modules/autoscaling-group"
  region             = var.region
  image_id           = var.image_id[var.region]
  security_groups    = [aws_security_group.allow-http.id, aws_security_group.allow-ssh.id]
  user_data          = file("../assets/install_space_invaders.sh")
  add_public_ip      = var.add_public_ip
  instance_count_max = var.instance_count_max
  instance_count_min = var.instance_count_min
  instance_type      = var.instance_type
}


module "vpc" {
  source   = "../modules/vpc"
  prefix   = var.project
  region   = var.region
  vpc_cidr = var.vpc_cidr
  subnets = [
    {
      zone       = "${var.region}a",
      cidr_block = var.subnet_a_cidr,
    },
    {
      zone       = "${var.region}b",
      cidr_block = var.subnet_b_cidr,
    },
  ]
}

module "load-balancer" {
  source          = "../modules/load-balancer"
  prefix          = var.project
  security_groups = [aws_security_group.allow-http.id]
  subnets         = module.vpc.subnets
}