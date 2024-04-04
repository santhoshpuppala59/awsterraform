variable "region" {
  description = "Region in which AWS Resources to be created"
  type        = string
  default     = ""
}
# Environment Variable
variable "environment" {
  description = "Environment Variable used as a prefix"
  type        = string
  default     = ""
}
# Business Division
variable "owners" {
  description = "organization this Infrastructure belongs"
  type        = string
  default     = ""
}

# VPC variables defined as below


# VPC Name
variable "name-1" {
  description = "VPC Name"
  type        = string
  default     = "vpc"
}
# VPC CIDR Block
variable "cidr-1" {
  description = "VPC CIDR Block"
  type        = string
  default     = ""
}

# VPC Availability Zones
variable "azs-1" {
  description = "A list of availability zones names or ids in the region"
  type        = list(string)
  default     = ["eu-west-2a", "eu-west-2b"]
}


# VPC Private Subnets
variable "private_subnets-1" {
  description = "A list of private subnets inside the VPC"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

# VPC Name
variable "name-2" {
  description = "VPC Name"
  type        = string
  default     = "vpc"
}
# VPC CIDR Block
variable "cidr-2" {
  description = "VPC CIDR Block"
  type        = string
  default     = ""
}

# VPC Availability Zones
variable "azs-2" {
  description = "A list of availability zones names or ids in the region"
  type        = list(string)
  default     = ["eu-west-2a", "eu-west-2b"]
}


# VPC Private Subnets
variable "private_subnets-2" {
  description = "A list of private subnets inside the VPC"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

# VPC Name
variable "name-3" {
  description = "VPC Name"
  type        = string
  default     = "vpc"
}
# VPC CIDR Block
variable "cidr-3" {
  description = "VPC CIDR Block"
  type        = string
  default     = ""
}

# VPC Availability Zones
variable "azs-3" {
  description = "A list of availability zones names or ids in the region"
  type        = list(string)
  default     = ["eu-west-2a", "eu-west-2b"]
}


# VPC Private Subnets
variable "private_subnets-3" {
  description = "A list of private subnets inside the VPC"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}