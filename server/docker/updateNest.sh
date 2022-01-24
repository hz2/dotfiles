#!/bin/sh
docker system prune -f
reg=registry.gitlab.com/hzsq/project-nest
docker rm -f some-nest
docker pull ${reg}
docker run --name some-nest --network="host" -d ${reg}
