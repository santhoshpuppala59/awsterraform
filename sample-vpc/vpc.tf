module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${var.name}-${local.name}"
  cidr = var.cidr

  azs             = var.azs
  private_subnets = var.private_subnets
 

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}