#!/bin/sh

docker system prune -f
reg=ghcr.io/hz2/project-nest:master
# reg=registry.gitlab.com/hzsq/project-nest:latest
docker rm -f some-nest
docker pull ${reg}
docker run --name some-nest --network="host" ${reg}
