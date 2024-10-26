# modules/ec2_instance/main.tf

resource "aws_instance" "ec2_instance" {
  ami           = var.ami_id               # AMI ID will be passed as a variable
  instance_type = var.instance_type        # Instance type will be passed as a variable

  tags = {
    Name = var.instance_name               # Instance name will be passed as a variable
    env = terraform.workspace
  }
}

