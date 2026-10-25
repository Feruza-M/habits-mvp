resource "aws_s3_bucket" "reports" {
  bucket = var.reports_bucket_name

  tags = {
    Name    = "${var.project_name}-reports"
    Project = var.project_name
  }
}

resource "aws_s3_bucket_public_access_block" "reports" {
  bucket = aws_s3_bucket.reports.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
