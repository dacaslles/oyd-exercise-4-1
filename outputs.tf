output "log_archive_outputs" {
  value       = module.log_archive
  description = "Salidas del módulo log_archive (nombre y ARN del bucket)."
}

output "user_events_outputs" {
  value       = module.user_events
  description = "Salidas del módulo user_events (nombre y ARN de la tabla)."
}