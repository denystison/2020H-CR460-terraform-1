data "google_compute_network" "default_network" {
  name = "default-us-east1"
  project = data.google_project.default-project.project_id
}

data "google_project" "default-project" {
project_id = var.projectid

}
