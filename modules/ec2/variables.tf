variable "vpc_id" {}
variable "private_subnet_ids" { type = list(string) }
variable "instance_type" {}
variable "ami_id" {}
variable "alb_sg_id" {}
variable "instance_count" {}
