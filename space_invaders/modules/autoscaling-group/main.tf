resource "aws_launch_configuration" "launch_configuration" {
  name = "${var.prefix}-launch-config"

  image_id                    = var.image_id
  instance_type               = var.instance_type
  security_groups             = var.security_groups
  associate_public_ip_address = var.add_public_ip

  user_data = var.user_data

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "auto-scaling" {
  name              = "${var.prefix}-asg"
  min_size          = var.instance_count_min
  max_size          = var.instance_count_max
  health_check_type = "ELB"
  load_balancers    = [aws_elb.elb.id]

  launch_configuration = aws_launch_configuration.launch_configuration.name

  vpc_zone_identifier = [
    aws_subnet.subnet-a.id,
    aws_subnet.subnet-b.id
  ]

  # Required to redeploy without an outage.
  lifecycle {
    create_before_destroy = true
  }

  tag {
    key                 = "Name"
    value               = "${var.prefix}-webserver"
    propagate_at_launch = true
  }
}
