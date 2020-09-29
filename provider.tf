provider "google" {
  project = var.projectid
  credentials = "account.json"
  region  = "us-east1"
  zone    = var.zone
}
