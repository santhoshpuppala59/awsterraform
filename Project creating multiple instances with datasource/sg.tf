# Create Security Group - All Traffic
resource "aws_security_group" "vpc-all" {
  name        = "vpc-all"
  description = "Dev VPC all"
  ingress {
    description = "Allow All Port "
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Allow all ip and ports outboun"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}