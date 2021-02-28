# Create a security group to allow connection to bastion over SSH and HTTP
resource "aws_security_group" "bastion_sg" {
  name        = "bastion_sg"
  description = "Allow Connection over port 22 and port 80"

  dynamic "ingress" {
    for_each = var.sg_port 
    iterator = port_number
    content {
        from_port   = port_number.value
        to_port     = port_number.value
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "bastion_sg"
  }
}

resource "aws_instance" "bastion_host" {
    ami = data.aws_ami.amazon_linux_2.id 
    instance_type = var.ec2_instance_type
    user_data = file(var.user_data_script)
    key_name = var.ec2_key_name
    security_groups = [aws_security_group.bastion_sg.name]
    tags = {
        Name = "bastion_host"
    }
}

output "bastion_public_ip" {
    value = aws_instance.bastion_host.public_ip
}