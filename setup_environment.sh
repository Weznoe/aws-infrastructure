#!/bin/sh
aws configure
sudo yum install -y yum-utils
sudo yum-config-manager --ad-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform

