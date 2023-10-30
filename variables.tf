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

variable "account_id" {
  description = "The service account ID. Changing this forces a new service account to be created."
}

variable "description" {
  description = "The display name for the service account. Can be updated without creating a new resource."
  default     = "managed-by-terraform"
}

variable "roles" {
  type        = list(string)
  description = "The roles that will be granted to the service account."
  default     = []
}

variable "gcp_service_list" {
  type        = list(string)
  description = "The list of apis necessary for the project"
  default     = []
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