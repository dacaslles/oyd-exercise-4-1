variable "table_name" {
  type        = string
  description = "Es el nombre base de la tabla."
}

variable "environment" {
  type        = string
  description = "Para identificar el entorno (dev, prod, etc.)."
}