variable "region" {
  type        = string
  description = "Región de AWS para el despliegue. Esta se usará en el provider.tf."
}

variable "environment" {
  type        = string
  description = "Entorno de despliegue (ej. dev, prod)."
}