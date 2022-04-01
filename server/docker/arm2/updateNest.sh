#!/bin/sh
docker system prune -f
reg=ghcr.io/hz2/project-nest:master
docker rm -f some-nest
docker pull ${reg}
docker run --name some-nest --network="host" --restart unless-stopped -d ${reg}
