#!/bin/bash
set -e 

echo "Installing dependencies / system tools"
sudo yum install -y unzip \
    ipset \
    dos2unix \
    net-tools \
    wget \
    curl \
    nano \
    git \
    telnet \
    unzip \
    jq

echo "Installing Ansible"
sudo yum install -y epel-release
sudo yum install -y ansible
useradd -p admin admin
