#!/usr/bin/env bash
set -e

# Update system packages
sudo apt update && sudo apt upgrade -y

# Install Ruby (includes gem)
# sudo apt install ruby-full -y

# Install Bundler
# gem install bundler

# Install Java (OpenJDK 17 - recommended)
# sudo apt install openjdk-17-jdk -y

# Install Maven
# sudo apt install maven -y

# Install Node and npm
# sudo apt install -y nodejs npm

# Install Terraform
# sudo apt install -y gnupg software-properties-common
# wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
# gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint
# echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
# sudo apt update
# sudo apt-get install terraform




cd /tmp
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip -o awscliv2.zip
sudo ./aws/install

cd $GITHUB_WORKSPACE

aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID
aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY
aws configure set default.region $AWS_DEFAULT_REGION
aws configure set cli_auto_prompt $AWS_CLI_AUTO_PROMPT

echo "AWS CLI installed and configured!"
aws --version