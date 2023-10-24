
resource "google_pubsub_topic" "topic" {
  name                       = "${var.topic_name}-${var.environment}"
  message_retention_duration = var.retention
}

resource "google_pubsub_topic_iam_binding" "binding" {
  project = google_pubsub_topic.topic.project
  topic   = google_pubsub_topic.topic.name
  role    = "roles/publisher"
  members = var.service_account_members
}


resource "google_service_account" "default" {
  account_id   = lower(var.service_account.account_id)
  display_name = lower(var.service_account.display_name)
  project      = var.fun_project_id
}

//permission
resource "google_project_iam_member" "permissions_am" {
  project = var.fun_project_id
  for_each = toset([
    "roles/bigquery.dataEditor",
    "roles/cloudfunctions.invoker",
    "roles/run.invoker",
    "roles/cloudsql.admin",
    "roles/cloudsql.client",
    "roles/cloudsql.editor",
    "roles/logging.admin",
    "roles/logging.logWriter",
    "roles/pubsub.publisher",
    "roles/bigquery.admin"
  ])
  role   = each.key
  member = "serviceAccount:${google_service_account.default.email}"
}