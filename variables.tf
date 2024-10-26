variable "aws_region" {
  description = "The AWS region to deploy in"
  default = "us-east-1"
}

variable "instance_type" {
  description = "The type of EC2 instance."
  type        = string
  #default     = "t2.micro"    # Cost-effective instance type # You can set a default valu
}

variable "instance_name" {
  description = "The name for the EC2 instance."
  type        = string
}

variable "bucket_name" {
  description = "The name of the S3 bucket for remote state storage."
  type        = string
  default = "umesh00984"
}
variable "dynamodb_table" {
  description = "The name of the DynamoDB table for state locking."
  type        = string
  default = "umesh98483"
}