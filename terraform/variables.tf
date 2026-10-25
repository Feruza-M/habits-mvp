variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "AWS EC2 key pair name"
  type        = string
}

variable "reports_bucket_name" {
  description = "S3 bucket for habit CSV reports"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "habits-mvp"
}
