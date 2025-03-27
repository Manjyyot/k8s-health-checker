#!/bin/bash

set -e

echo "Updating package list..."
sudo apt update -y

echo "Installing AWS CLI..."
# Install AWS CLI
sudo apt install -y awscli

echo "Installing eksctl..."
# Download the latest version of eksctl
curl -LO https://github.com/eksctl-io/eksctl/releases/download/v0.206.0/eksctl_Linux_amd64.tar.gz

# Extract the eksctl binary
tar -xvzf eksctl_Linux_amd64.tar.gz

# Move the eksctl binary to /usr/local/bin
sudo mv eksctl /usr/local/bin/

# Make the eksctl binary executable
sudo chmod +x /usr/local/bin/eksctl

echo "Installing kubectl..."
# Use AWS's official source to download kubectl
curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.32.0/2025-01-10/bin/linux/amd64/kubectl

# Make kubectl executable
chmod +x kubectl

# Move kubectl to /usr/local/bin
sudo mv kubectl /usr/local/bin/

echo "Installing Helm..."
# Install Helm
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

echo "Setup complete."

# Verify installations
echo "Verifying installation of AWS CLI..."
aws --version

echo "Verifying installation of eksctl..."
eksctl version

echo "Verifying installation of kubectl..."
kubectl version --client

echo "Verifying installation of Helm..."
helm version
