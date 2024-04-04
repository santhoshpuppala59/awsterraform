# Create EC2 instances
resource "aws_instance" "ec2-instance" {
  count = length(data.aws_subnets.vpcsubnet.ids)
  ami           = data.aws_ami.amzlinux.id 
  instance_type = var.instance_type      # Replace with your instance type
  subnet_id     =  element(data.aws_subnets.vpcsubnet.ids, count.index)
  key_name      = "santhosh"
  #vpc_security_group_ids = ["aws_security_group.vpc-all.id"]
  tags = {
    Name = "Instances"
  }

}