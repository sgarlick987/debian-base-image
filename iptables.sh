#! /bin/sh
set -e
## rate limit connections on port 22 for ssh
sudo iptables -I INPUT -p tcp --dport 22 -i eth0 -m state --state NEW -m recent \
  --set
sudo iptables -I INPUT -p tcp --dport 22 -i eth0 -m state --state NEW -m recent \
  --update --seconds 600 --hitcount 2 -j DROP

## block the aws metadata service for non root users
sudo iptables -A OUTPUT -m owner ! --uid-owner root -d 169.254.169.254 -j DROP

## save our rules
sudo apt-get update
DEBIAN_FRONTEND=noninteractive sudo -E apt-get install -y -q iptables-persistent