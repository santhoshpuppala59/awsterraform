################################ Resource-1: Create VPC #################################
resource "aws_vpc" "my_vpc" {
  cidr_block           = "10.1.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "MyVPC"
  }

}


################# Create a public subnet ############################

resource "aws_subnet" "vpc-dev-public-subnet-1" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.1.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

    tags = {
    Name        = "Public-subnet"
    environment      = "Prod"
    
  }

}

resource "aws_subnet" "vpc-dev-public-subnet-2" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.1.3.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

    tags = {
    Name        = "Public-Subnet"
    environment      = "Prod"
    
  }

}
################## Private subnet ###################
resource "aws_subnet" "vpc-dev-private-subnet-1" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.1.2.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false

    tags = {
    Name        = "Private-subnet"
    environment      = "Prod"    
  }
}

resource "aws_subnet" "vpc-dev-private-subnet-2" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.4.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = false

    tags = {
    Name        = "Private subnet"
    environment      = "Prod"
    
  }


}

################ Resource-3: Internet Gateway###############################

resource "aws_internet_gateway" "myvpc_igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "vpc-IGW"
  }

}

#####################Nat Gateway###########################

resource "aws_eip" "nat-eip" {
  vpc = true
   tags = {
      Name = "nat-eip"
      }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat-eip.id
  subnet_id     = aws_subnet.vpc-dev-public-subnet-1.id
  tags = {
      Name = "nat-gateway"
      }
}


###################  Create Route Table Public##########

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.my_vpc.id

   tags = {
    Name = "public-route-table"
  }

}

###################  Create Route Table Private ##########
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.my_vpc.id

   tags = {
    Name = "private-route-table"
  }

}

#############Public Route association################################
# Resource-5: Create Route in Route Table for Internet Access
resource "aws_route" "vpc-public-rt" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.myvpc_igw.id

}

# Resource-6: Associate the Route Table with the Subnet
resource "aws_route_table_association" "vpc-rt-ass-pub-1a" {
  route_table_id = aws_route_table.public_rt.id
  subnet_id      = aws_subnet.vpc-dev-public-subnet-1.id
}

resource "aws_route_table_association" "vpc-rt-ass-pub-1b" {
  route_table_id = aws_route_table.public_rt.id
  subnet_id      = aws_subnet.vpc-dev-public-subnet-2.id
}




############# Route for NAT Gateway###############################
resource "aws_route" "private_internet_gateway" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.nat.id
}

# Route table associations for both Public & Private Subnets
resource "aws_route_table_association" "vpc-rt-ass-pri-1a" {
  route_table_id = aws_route_table.private_rt.id
  subnet_id      = aws_subnet.vpc-dev-private-subnet-1.id
}

resource "aws_route_table_association" "vpc-rt-ass-pri-1b" {
  route_table_id = aws_route_table.private_rt.id
  subnet_id      = aws_subnet.vpc-dev-private-subnet-2.id
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
