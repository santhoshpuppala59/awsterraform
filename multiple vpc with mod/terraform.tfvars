# Generic Variables
region      = "us-east-1"
environment = "prod"
owners      = "aws"


# VPC-1 Variables

vpcs = [
  {
    #name           = "vpc-terraform-vpc-1" # Overridning the name defined in variable file
    cidr           = "10.0.0.0/16"
    azs           = ["us-east-1a", "us-east-1b"]
    private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  },

{
    #name           = "vpc-terraform-vpc-2" # Overridning the name defined in variable file
    cidr            = "10.1.0.0/16"
    azs           = ["us-east-1a", "us-east-1b"]
    private_subnets = ["10.1.1.0/24", "10.1.2.0/24"]
  },

  {
    #name           = "vpc-terraform-vpc-3" # Overridning the name defined in variable file
    cidr            = "10.2.0.0/16"
    azs           = ["us-east-1a", "us-east-1b"]
    private_subnets = ["10.2.1.0/24", "10.2.2.0/24"]
    
  }
]
