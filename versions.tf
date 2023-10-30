terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 4.0"
    }
  }

  required_version = "~> 1"
}

provider "google" {
  credentials     = file("account.json")
  project         = var.project_id
  region          = var.region
  zone            = var.zone
  request_timeout = "60s"
}