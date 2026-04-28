output "alb_dns" {
  value = module.alb.alb_dns
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "subnet_ids" {
  value = module.vpc.public_subnet_ids
}
