#! /bin/sh
set -e
while [ ! -f /var/lib/cloud/instance/boot-finished ]; do echo "Waiting for cloud-init to finish..."; sleep 1; done