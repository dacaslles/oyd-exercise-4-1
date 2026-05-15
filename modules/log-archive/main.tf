# Recurso principal del Bucket
resource "aws_s3_bucket" "this" {
  bucket = "${var.bucket_name}-${var.environment}"
}

# Configuración de Versionamiento
resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Configuración de Cifrado SSE-S3
resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Regla de Ciclo de Vida
resource "aws_s3_bucket_lifecycle_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    id     = "log-expiration"
    status = "Enabled"

    filter {
      prefix = var.log_prefix
    }

    noncurrent_version_expiration {
      noncurrent_days = 60
    }
  }
}

# Política de Bucket: Solo HTTPS
resource "aws_s3_bucket_policy" "this" {
  bucket = aws_s3_bucket.this.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Deny"
        Principal = "*"
        Action    = "s3:*"
        Resource = [
          aws_s3_bucket.this.arn,
          "${aws_s3_bucket.this.arn}/*",
        ]
        Condition = {
          Bool = {
            "aws:SecureTransport" = "false"
          }
        }
      },
    ]
  })
}
