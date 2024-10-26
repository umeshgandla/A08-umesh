
output "instance_id" {
  description = "The ID of the EC2 instance."
  value       = module.ec2_instance.instance_id
}

output "instance_public_ip" {
  description = "The public IP address of the EC2 instance."
  value       = module.ec2_instance.instance_public_ip

}

output "s3_bucket_name" {
  description = "The name of the S3 bucket."
  value       = aws_s3_bucket.rs3.bucket
}

output "dynamodb_table_name" {
  description = "The name of the DynamoDB table."
  value       = aws_dynamodb_table.rdyb.name
}
