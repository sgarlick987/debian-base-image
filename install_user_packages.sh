#! /bin/sh
set -e
sudo apt-get update
sudo apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade
sudo apt-get install -y curl \
                        ca-certificates \
                        cloud-initramfs-growroot \
                        bash-completion \
                        net-tools \
                        dnsutils \
                        htop \
                        fail2ban \
                        logrotate \
                        python \
                        python-dev \
                        python-pip \
                        sysstat \
                        rsyslog \
                        wget \
                        vim \
                        emacs \
                        zsh

sudo pip install --upgrade awscli \
                            boto3