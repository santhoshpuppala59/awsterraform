# Generic Variables
region      = "us-east-1"
environment = "prod"
owners      = "aws"


# VPC Variables
name                               = "vpc-terraform" # Overridning the name defined in variable file
cidr                               = "10.0.0.0/16"
azs                                = ["us-east-1a", "us-east-1b"]
private_subnets                    = ["10.0.1.0/24", "10.0.2.0/24"]
