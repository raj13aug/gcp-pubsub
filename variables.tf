variable "project_id" {
  description = "The project ID to deploy to"
  type        = string
  default     = "terraform-pubsub"
}

variable "region" {
  description = "The region to deploy to"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "The zone to deploy to"
  type        = string
  default     = "us-central1-c"
}



/* Required */
variable "topic_name" {
  type = string
}

variable "environment" {
  type        = string
  description = "prod or staging"
}

variable "service_account_members" {
  type        = list(string)
  description = "List of service account members (of the format serviceAccount:{email}) to grant permission to publish to this topic"
}

/* Optional */
variable "retention" {
  type        = string
  default     = "604800s"
  description = "How long the topic should retain messages for. Default is 7 days."
}

# variable "pub_sub" {
#   description = "variable to create pub-sub"
#   type = list(object({
#     topic      = string
#     project_id = string
#     custom_sa  = string
#     pull_subscriptions = list(object({
#       name                         = string
#       dead_letter_topic            = string
#       ack_deadline_seconds         = string
#       max_delivery_attempts        = string
#       enable_exactly_once_delivery = bool
#       message_retention_duration   = string
#       //   service_account              = string
#       expiration_policy = list(object({
#         ttl = string
#       }))
#     }))
#   }))
# }