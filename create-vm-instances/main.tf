// Configure the Google Cloud provider
provider "google" {
 credentials = file("key.json")
 project     = "stone-climate-347808"
 region      = "us-central1"
}

// Terraform plugin for creating random ids
resource "random_id" "instance_id" {
 byte_length = 8
}


// A single Compute Engine instance
resource "google_compute_instance" "default" {
 name         = "terraform-${random_id.instance_id.hex}"
 machine_type = "f1-micro"
 zone         = "us-central1-a"

 boot_disk {
     device_name = "ekdisk"
   initialize_params {
     image = "ubuntu-os-cloud/ubuntu-minimal-2004-lts"
     size  = "20"
     type  = "pd-standard"
   }
 }

// Make sure flask is installed on all new instances for later steps
 metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq build-essential python-pip rsync"

 network_interface {
   network     = "default"
   network_ip  = "10.128.0.23"
   access_config {
    
  metadata = {
    foo = "bar"
  }
     network_tier = "STANDARD"
     // Include this section to give the VM an external ip address
   }
 }
}
