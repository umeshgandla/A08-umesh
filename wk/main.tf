module "ec2_instance" {
  source        = "../modules/ec2"  # Path to the module
  ami_id       = "ami-0ddc798b3f1a5117e"
  instance_type = var.instance_type
  instance_name = "${var.instance_name}-${terraform.workspace}-ec2"
  tags = {
    env = terraform.workspace
  }
}