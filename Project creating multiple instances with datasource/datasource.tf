# Get latest AMI ID for Amazon Linux2 OS
data "aws_ami" "amzlinux" {
  most_recent = true
  owners = [ "amazon" ]
  filter {
    name = "name"
    values = [ "amzn2-ami-hvm-*-gp2" ]
  }
  filter {
    name = "root-device-type"
    values = [ "ebs" ]
  }
  filter {
    name = "virtualization-type"
    values = [ "hvm" ]
  }
  filter {
    name = "architecture"
    values = [ "x86_64" ]
  }
}

output "ami_details" {
    value = data.aws_ami.amzlinux.id
    }


#Get the VPC

data "aws_vpcs" "test" {
  
  filter {
    name   = "tag:Name"
    values = ["santhosh"]
  }
  # Add more filters if needed
  filter {
    name   = "tag:name"
    values = ["vpc-test"]
  }
}



data "aws_subnets" "vpcsubnet" {
  filter {
    name   = "availability-zone"
    values = ["us-east-1a"]  # Replace with the AZ you want to filter by
  }
  filter {
    name   = "tag:Name"
    values = ["santhosh"]
  }
  # Add more filters if needed
  filter {
    name   = "tag:name"
    values = ["vpc-test"]
  }
  #for_each = toset(data.aws_vpcs.test.ids)

  
}

output "ids2" {
  value = [  for id in data.aws_subnets.vpcsubnet : id   ]
}
