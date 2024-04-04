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

# Intance size
variable "instance_type" {
  description = "organization this Infrastructure belongs"
  type        = string
  default     = ""
}


