# Create a Security Group to allow connections only from bastion_host security group
resource "aws_security_group" "allow_bastion" {
  name        = "allow_bastion"
  description = "Allow Bastion host to connect to the EC2 instance using SSH."

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [aws_security_group.bastion_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_bastion"
  }
}

# Spin up an EC2 instance in the default VPC 
resource "aws_instance" "private_ec2" {
    ami = data.aws_ami.amazon_linux_2.id 
    associate_public_ip_address = false 
    instance_type = var.ec2_instance_type
    iam_instance_profile = aws_iam_instance_profile.s3_full_access_profile.id
    key_name = var.ec2_key_name
    security_groups = [aws_security_group.allow_bastion.name]
    tags = {
        Name = "private_ec2"
    }
}
