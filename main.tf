# module "ec2_instance" {
#   source        = "./modules/ec2"  # Path to the module
#   ami_id       = "ami-0ddc798b3f1a5117e"     # Replace with your desired AMI ID
#   instance_type = var.instance_type           # Use variable defined in root
#   instance_name = "umeshec2"                  # Instance name tag
# }

# # main.tf

# module "ec2_instance" {
#   source        = "./modules/ec2"  # Path to the module
#   ami_id       = "ami-0ddc798b3f1a5117e"     # Replace with your desired AMI ID
#   instance_type = var.instance_type           # Use variable defined in root
#   instance_name = "${terraform.workspace}-umeshec2"  # Dynamic instance name based on workspace
#   tags = {                                      # Pass tags as a map
#     env = terraform.workspace                   # Set environment tag based on workspace
#   }
# }


module "ec2_instance" {
  source        = "./modules/ec2"  # Path to the module
  ami_id       = "ami-0ddc798b3f1a5117e"
  instance_type = var.instance_type
  instance_name = "${var.instance_name}-${terraform.workspace}-ec2"
  tags = {
    env = terraform.workspace
  }
}

# Other resources...

resource "aws_s3_bucket" "rs3" {
  bucket = var.bucket_name
}
resource "aws_dynamodb_table" "rdyb" {
  name         = var.dynamodb_table
  billing_mode = "PAY_PER_REQUEST" # mode means you only pay for the read and write requests

  attribute {
    name = "LockID"     #  partition key for the DynamoDB table
    type = "S"
  }
  hash_key = "LockID" #LockID will be the unique identifier for each lock entry stored in the table,
}

# terraform {
#   backend "s3" {
#     bucket         = "umesh00984"        # Replace with your S3 bucket variable
#     key            = "terraform/state"   # Path for storing the state file
#     region         = "us-east-1"         # AWS region
#     dynamodb_table = "umesh98483"  # DynamoDB table for locking, option ensures that only one user or system can modify the Terraform state file at a time
#     encrypt        = true                # Encrypt state file at rest
#   }
# }
