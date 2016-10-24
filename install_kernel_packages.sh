#! /bin/sh
set -e
sudo apt-get update
sudo apt-get -t jessie-backports install -y linux-headers-amd64
sudo apt-get -t jessie-backports install -y linux-image-amd64