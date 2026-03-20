#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/terraform"

if [ ! -f terraform.tfvars ]; then
  echo "Error: terraform/terraform.tfvars not found. Copy terraform.tfvars.example and fill in your token."
  exit 1
fi

terraform init
terraform apply -auto-approve

echo ""
echo "Server IP: $(terraform output -raw server_ip)"
echo "Connect with: autossh -M 0 -o StrictHostKeyChecking=no root@$(terraform output -raw server_ip)"
