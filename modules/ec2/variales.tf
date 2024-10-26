# modules/ec2_instance/variables.tf

variable "ami_id" {
  description = "The AMI ID for the EC2 instance."
  type        = string
}

variable "instance_type" {
  description = "The type of EC2 instance."
  type        = string
}

variable "instance_name" {
  description = "The name tag for the EC2 instance."
  type        = string
}

variable "tags" {
  description = "Tags for the instance"
  type        = map(string)
}
