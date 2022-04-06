#!/bin/sh
docker system prune -f
docker rm -f rancher
docker pull rancher/rancher

docker run --name rancher -d --restart=unless-stopped \
  -p 8480:80 -p 8443:443 \
  -v /opt/rancher:/var/lib/rancher \
  --privileged \
  rancher/rancher:latest --no-cacerts
