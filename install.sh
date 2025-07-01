#!/usr/bin/bash
echo "***************************"
echo "Install Unzip"
echo "***************************"
echo "\n"

sudo apt-get install unzip -y

echo "***************************"
echo "Installing AWS CLI"
echo "***************************"
echo "\n"


curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

echo "***************************"
echo "Installing gnupg and software-properties-common" 
echo "***************************"
echo "\n"
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common

echo "***************************"
echo "Installing Terraform"
echo "***************************"
echo "\n"

wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null


gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform -y

echo "***************************"
echo "successfully installed Terraform"
echo "***************************"