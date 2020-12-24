#!/bin/bash -e

TERRAFORM_VERSION="0.14.0"
ANSIBLE_VERSION="2.10.3"

# Install Ansible ----------------------------------------------
echo "Installing Ansible --------------------------------------"
sudo apt-get update -y
sudo apt-get install -y python3-pip

sudo pip3 install --upgrade ansible==${ANSIBLE_VERSION}


# Install Terraform --------------------------------------------
echo "Installing Terraform -------------------------------------"
sudo apt-get update && sudo apt-get install -y zip unzip jq

curl -fso /tmp/terraform-${TERRAFORM_VERSION}.zip \
  https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip

sudo unzip -o /tmp/terraform-${TERRAFORM_VERSION}.zip -d /usr/local/bin/
terraform -install-autocomplete


# Install Pulumi -----------------------------------------------
#echo "Installing Pulumi ----------------------------------------"
#curl -fsSL https://get.pulumi.com | sh
#sudo apt-get install nodejs
#sudo apt-get install npm
