module "vpc-1" {
  source = "terraform-aws-modules/vpc/aws"

  
  name = "${var.name-1}-${local.name}"
  cidr = var.cidr-1
  azs             = var.azs-1
  private_subnets = var.private_subnets-1


  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "vpc-2" {
  source = "terraform-aws-modules/vpc/aws"

  
  name = "${var.name-2}-${local.name}"
  cidr = var.cidr-2
  azs             = var.azs-2
  private_subnets = var.private_subnets-2


  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "vpc-3" {
  source = "terraform-aws-modules/vpc/aws"

  
  name = "${var.name-3}-${local.name}"
  cidr = var.cidr-3
  azs             = var.azs-3
  private_subnets = var.private_subnets-3


  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}