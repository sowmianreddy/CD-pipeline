#!/bin/bash

sudo yum update -y
sudo wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install epel-release-latest-7.noarch.rpm
sudo yum-config-manager --enable epel
sudo amazon-linux-extras install ansible2
