# Input Variables
variable "aws_region" {
  description = "Region in which AWS resources to be created"
  type        = string
  default     = "us-east-1"
}

variable "ec2_ami_id" {
  description = "AMI ID"
  type        = string
  default     = "ami-07761f3ae34c4478d" # Amazon2 Linux AMI ID
}

variable "ec2_instance_count" {
  description = "EC2 Instance Count"
  type        = number
  default     = 1
}

variable "ec2_instance_type" {
  description = "EC2 Instance type"
  type        = string
  default     = "t2.micro"
}

variable "ec2_key_pair" {
  description = "EC2 Instance type"
  type        = string
  default     = "santhosh"
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
  default     = "10.1.0.0/16"
}

variable "vpc_pub_sub1_cidr" {
  description = "VPC Pub Subnet"
  type        = string
  default     = "10.1.1.0/24"
}
variable "vpc_pub_sub2_cidr" {
  description = "VPC pub subnet2"
  type        = string
  default     = "10.1.3.0/24"
}
variable "vpc_pri_sub1_cidr" {
  description = "VPC private subnet1"
  type        = string
  default     = "10.1.2.0/24"
}
variable "vpc_pri_sub2_cidr" {
  description = "VPC private subnet2"
  type        = string
  default     = "10.1.4.0/24"
}
