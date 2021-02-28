# Grab the latest Amazon Linux 2 ami id 
data "aws_ami" "amazon_linux_2" {
    most_recent = true 
    owners = ["amazon"]

    filter {
        name = "name"
        values = ["amzn2-ami-hvm-*-x86_64-ebs"]
    }
}