resource "google_pubsub_schema" "burger" {
  name = "burger"
  type = "AVRO"
  definition = jsonencode({
    "type" : "record",
    "name" : "Avro",
    "fields" : [
      {
        "name" : "burgerName",
        "type" : "string",
        "default" : false
      },
      {
        "name" : "burgerPrice",
        "type" : "double",
        "default" : false
      }
    ]
  })
}


resource "google_pubsub_topic" "burger" {
  name = "burger-topic"

  labels = {
    foo = "bar"
  }

  depends_on = [google_pubsub_schema.burger]
  schema_settings {
    schema   = "projects/${var.project_id}/schemas/burger"
    encoding = "JSON"
  }

  message_retention_duration = "86600s"
}

resource "google_pubsub_subscription" "example" {
  name  = "dhruv-subscription-github"
  topic = google_pubsub_topic.example.name

  labels = {
    foo = "bar"
  }

  # 20 minutes
  message_retention_duration = "1200s"
  retain_acked_messages      = true

  ack_deadline_seconds = 20

  expiration_policy {
    ttl = "300000.5s"
  }
  retry_policy {
    minimum_backoff = "10s"
  }

  enable_message_ordering = false
}

resource "google_service_account" "default" {
  account_id   = lower(var.service_account.account_id)
  display_name = lower(var.service_account.display_name)
}

//permission
resource "google_project_iam_member" "permissions_am" {
  project = var.fun_project_id
  for_each = toset([
    "roles/cloudsql.admin",
    "roles/pubsub.admin"
  ])
  role   = each.key
  member = "serviceAccount:${google_service_account.default.email}"
}

resource "google_service_account_key" "vault_gcp_tests" {
  service_account_id = google_service_account.default.name
}

resource "local_file" "vault_gcp_tests" {
  content  = base64decode(google_service_account_key.vault_gcp_tests.private_key)
  filename = "${path.module}/vault-tester.json"
}