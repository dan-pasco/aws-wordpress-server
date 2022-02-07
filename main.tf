# Declare AWS Provider and CLI Credentials
provider "aws" {
  region     = "ap-southeast-2"
  }

module "asg" {

  source = "./asg"
  
}

module "vpc" {

  source = "./vpc"
  
}

module "sg" {

  source = "./sg"
  
}



resource "aws_elb" "my_elb" {
  name = "my-alb"
  subnets = [ module.vpc.subnet1_output_id,module.vpc.subnet2_output_id]
  security_groups = [module.sg.sg_id.id]

  listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port =80
    lb_protocol = "http"
  }

health_check {
  healthy_threshold = 2
  unhealthy_threshold = 2
  timeout =3
  target = "HTTP:80/"
  interval = 30
}

cross_zone_load_balancing = true
connection_draining = true  
connection_draining_timeout = 400



tags = {
  Name = "My_ELB"
}

}

# Stitch Up the ELB with the ASG

resource "aws_autoscaling_attachment" "asg_attachment_bar" {
  autoscaling_group_name = module.asg.asg_id.id
  elb                    = aws_elb.my_elb.id
}