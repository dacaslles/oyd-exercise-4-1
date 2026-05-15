output "s3_bucket_name" {
  value       = module.log_archive.bucket_name
  description = "Nombre del bucket de logs creado"
}

output "dynamodb_table_name" {
  value       = module.user_events.table_name
  description = "Nombre de la tabla de DynamoDB creada"
}