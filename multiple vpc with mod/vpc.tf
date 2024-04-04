module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  
for_each = { for idx, vpc in var.vpcs : idx => vpc }
  
  cidr = each.value.cidr
  azs =  each.value.azs
  private_subnets = each.value.private_subnets
  

  tags = {
    Name = "santhosh"
    name = "vpc-test"
    Terraform   = "true"
    
  }
}

