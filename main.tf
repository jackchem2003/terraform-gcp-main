// Configure the Google Cloud provider
provider "google" {
  credentials = file("dbgcpfirst001-919cb366e18e.json")
  project     = "dbgcpfirst001"
  region      = "us-central1"
}

/* Terraform plugin for creating random ids
resource "random_id" "instance_id" {
  byte_length = 8
}*/

// A single Compute Engine instance
resource "google_compute_instance" "vm_instance" {
  name         = "flask-vm-000123"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  /* Make sure flask is installed on all new instances for later steps
  metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq build-essential python-pip rsync; pip install flask"*/

  network_interface {
    network = google_compute_network.vpc_network.self_link

    access_config {
      // Include this section to give the VM an external ip address
    }
  }
}


resource "google_compute_network" "vpc_network" {
  name                    = "terraform-network"
  auto_create_subnetworks = true
}