resource "aws_instance" "my-ec2" {
  ami                    = "ami-07761f3ae34c4478d "
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.vpc-dev-public-subnet-1.id
  key_name               = "santhosh"
  user_data              = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install httpd -y
    sudo systemctl enable httpd
    sudo systemctl start httpd
    echo "<h1>Welcome to StackSimplify ! AWS Infra created using Terraform in us-east-1 Region</h1>" > /var/www/html/index.html
    EOF  
  vpc_security_group_ids = [aws_security_group.myvpc-sg.id]
}
