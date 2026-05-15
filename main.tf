module "log_archive" {
  source = "./modules/log-archive"

  bucket_name = "oyd-log-archive-pdds-26001460"
  environment = var.environment
}

module "user_events" {
  source = "./modules/user-events"

  table_name  = "user-events"
  environment = var.environment
}