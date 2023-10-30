
gcp_service_list = [
  "storage.googleapis.com",
  "roles/pubsub.admin",
]

project_id = "some-project-id"

account_id  = "bucket-admin"
description = "Bucket Admin"
roles = [
  "roles/storage.admin",
  "roles/pubsub.admin",
]