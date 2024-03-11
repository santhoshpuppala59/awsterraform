# Resource-1: Create VPC
resource "aws_vpc" "my_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "MyVPC"
  }

}


# Create a public subnet

resource "aws_subnet" "vpc-dev-public-subnet-1" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true

}

# Resource-3: Internet Gateway

resource "aws_internet_gateway" "myvpc_igw" {
  vpc_id = aws_vpc.my_vpc.id

}

# Resource-4: Create Route Table

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.my_vpc.id

}

# Resource-5: Create Route in Route Table for Internet Access
resource "aws_route" "vpc-public-rt" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.myvpc_igw.id

}

# Resource-6: Associate the Route Table with the Subnet
resource "aws_route_table_association" "vpc-rt-ass-pub" {
  route_table_id = aws_route_table.public_rt.id
  subnet_id      = aws_subnet.vpc-dev-public-subnet-1.id
}

# Resource-7: Create Security Group

resource "aws_security_group" "myvpc-sg" {
  name        = "myvpc-sg"
  vpc_id      = aws_vpc.my_vpc.id
  description = "my security group"

  ingress {
    description = "Allow from 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow Port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
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
