terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.49"
    }
  }
}

provider "hcloud" {
  token = var.hcloud_token
}

resource "hcloud_ssh_key" "default" {
  name       = "my-ssh-key"
  public_key = file(var.ssh_public_key_path)
}

resource "hcloud_server" "cx23" {
  name        = "fog-vm"
  image       = "ubuntu-24.04"
  server_type = "cx23"
  location    = "nbg1" # Nuremberg — closest Hetzner location to Italy
  ssh_keys    = [hcloud_ssh_key.default.id]

  labels = {
    project = "fog-cloud-computing"
  }
}

output "server_ip" {
  value       = hcloud_server.cx23.ipv4_address
  description = "Public IPv4 address of the server"
}

output "server_id" {
  value       = hcloud_server.cx23.id
  description = "ID of the server"
}
