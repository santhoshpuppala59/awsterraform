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

variable "vpcs" {
  description = "List of VPC configurations"
  type        = list(object({
     cidr           = string
     azs             = list(string)
     private_subnets = list(string)
  }))
}


