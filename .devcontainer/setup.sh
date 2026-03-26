#!/usr/bin/env bash
set -e

# Update system packages
sudo apt update && sudo apt upgrade -y

# Install Ruby (includes gem)
sudo apt install ruby-full -y

# Install Bundler
gem install bundler

# Install Java (OpenJDK 17 - recommended)
sudo apt install openjdk-17-jdk -y

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