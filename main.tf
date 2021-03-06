provider "google" {
  credentials = file("/var/opt/morpheus/morpheus-ui/gcptest/neat-verbena-309818-5f48f96c31c3.json")
  #credentials = base64decode(var.google_creds)
  project     = "neat-verbena-309818"
  region      = "us-east1"
}

// Terraform plugin for creating random ids
resource "random_id" "instance_id" {
  byte_length = 8
}

// A single Compute Engine instance
resource "google_compute_instance" "default" {
  name         = "neat-vm-${random_id.instance_id.hex}"
  machine_type = "f1-micro"
  zone         = "us-east1-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  // Make sure flask is installed on all new instances for later steps
  metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq build-essential python-pip rsync; pip install flask"

  network_interface {
    network = "default"

    access_config {
      // Include this section to give the VM an external ip address
    }
  }
}

