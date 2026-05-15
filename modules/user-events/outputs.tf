output "table_name" {
  value       = aws_dynamodb_table.this.name
  description = "El nombre final de la tabla."
}

output "table_arn" {
  value       = aws_dynamodb_table.this.arn
  description = "El ARN de la tabla (útil para futuras políticas de IAM)."
}