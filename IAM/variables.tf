########## AWS ##########
variable "aws_region" {
    default = "af-south-1"
    description = "Current AWS region in use"
    type = string
}

########## Files ##########
variable "policy_dir" {
    default = "policy"
    description = "Directory containing JSON policies."
    type = string 
}

variable "user_data_script" {
  default = "script/user_data.sh"
  description = "Location of the user data script that will be executed at the first EC2 boot."
  type = string
}

########## EC2 ##########
variable "ec2_instance_type" {
    default = "t3.micro"
    description = "Type of the EC2 machine."
    type = string 
}

variable "ec2_key_name" {
    default = "theJaxon"
    description = "Key used to SSH into the instance."
    type = string 
}

########## Security Group ##########
variable "sg_port" {
    default = [22, 80]
    description = "List of allowed ports for ingress connection."
    type = list(number)
}