output "bucket_arn" {
  value       = aws_s3_bucket.this.arn
  description = "El ARN del bucket creado."
}

output "bucket_name" {
  value       = aws_s3_bucket.this.id
  description = "El ID o nombre del bucket."
}