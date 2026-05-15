variable "bucket_name" {
  description = "El nombre base para el bucket de S3."
  type        = string
}

variable "environment" {
  description = "El entorno de despliegue (ej. dev, qa, prod)."
  type        = string
}

variable "log_prefix" {
  description = "Prefijo para los archivos de log dentro del bucket."
  type        = string
  default     = "logs/"
}
