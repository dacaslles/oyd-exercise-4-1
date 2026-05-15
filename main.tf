module "log_archive" {
  source = "./modules/log-archive"

  bucket_name = "app-logs"
  environment = var.environment
}

module "user_events" {
  source = "./modules/user-events"

  table_name  = "user-events"
  environment = var.environment
}