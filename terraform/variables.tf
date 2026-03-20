variable "hcloud_token" {
  description = "Hetzner Cloud API token"
  type        = string
  sensitive   = true
}

variable "ssh_public_key_path" {
  description = "Path to the SSH public key to upload to the server"
  type        = string
  default     = "~/.ssh/id_ed25519.pub"
}
