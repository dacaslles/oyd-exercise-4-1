variable "region" {
  description = "Región de AWS para el despliegue. Esta se usará en el provider.tf."
  type        = string
}

variable "environment" {
  description = "Entorno de despliegue (ej. dev, prod)."
  type        = string
}