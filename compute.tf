resource "google_compute_instance" "canard" {
  name         = "canard"
  machine_type = "f1-micro"
  zone         = var.zone
  tags         = ["public"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.prod-dmz.name
    access_config {

    }
  }


  metadata_startup_script = "apt-get -y update && apt-get -y upgrade && apt-get -y install apache2 && systemctl start apache2"
}


resource "google_compute_instance" "mouton" {
  name         = "mouton"
  machine_type = "f1-micro"
  zone         = var.zone
  tags         = ["interne"]

  boot_disk {
    initialize_params {
      image = "fedora-coreos-cloud/fedora-coreos-next"

    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.prod-interne.name
    access_config {

    }
  }
}


resource "google_compute_instance" "cheval" {
  name         = "cheval"
  machine_type = "f1-micro"
  zone         = var.zone
  tags         = ["traitement"]

  boot_disk {
    initialize_params {
      image = "fedora-coreos-cloud/fedora-coreos-stable"
    }
  }
  network_interface {
    subnetwork = google_compute_subnetwork.prod-traitement.name

  }
}

resource "google_compute_instance" "fermier" {
  name         = "fermier"
  machine_type = "f1-micro"
  zone         = var.zone
  tags         = ["fermier"]

  boot_disk {
    initialize_params {
      image = "ubuntu-1604-lts"
    }
  }

  network_interface {
    network = "default"

  }
}
