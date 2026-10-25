output "app_public_ip" {
  description = "Public IP of application EC2"
  value       = aws_instance.app.public_ip
}

output "app_instance_id" {
  description = "Application EC2 instance ID"
  value       = aws_instance.app.id
}

output "reports_bucket_name" {
  description = "S3 bucket for habit reports"
  value       = aws_s3_bucket.reports.bucket
}
