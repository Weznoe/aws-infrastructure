
module "autoscaling-group" {
  source             = "../modules/autoscaling-group"
  region             = var.region
  load_balancers     = [module.load-balancer.elb_id]
  subnets            = module.vpc.subnets
  image_id           = var.image_id[var.region]
  security_groups    = [module.allow-http.sg_id, module.allow-ssh.sg_id]
  user_data          = file("../assets/install-space-invaders.sh")
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
  security_groups = [module.allow-http.sg_id]
  subnets         = module.vpc.subnets
}

module "allow-http" {
  source       = "../modules/security-group"
  name         = "${var.project}-allow-http"
  vpc_id       = module.vpc.vpc_id
  ingress_port = 80
  description  = "Enable HTTP access"
}

module "allow-ssh" {
  source       = "../modules/security-group"
  name         = "${var.project}-allow-ssh"
  vpc_id       = module.vpc.vpc_id
  ingress_port = 22
  description  = "Enable SSH access"
}

