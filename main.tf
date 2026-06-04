module "route53" {
  source           = "./modules/route53"
  hosted_zone_name = var.hosted_zone_name
  record_name      = var.record_name
  alb_dns_name     = module.asg.web_alb_dns_name
  alb_zone_id      = module.asg.web_alb_zone_id

}
