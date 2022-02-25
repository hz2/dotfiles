#!/bin/sh
docker system prune -f
docker rm -f gitea
docker pull gitea/gitea
docker run -d --name=gitea -p 10022:22 -p 8765:3000 --restart unless-stopped -v /gitea:/data gitea/gitea:latest




# gitea
# sudo mkdir -p /var/lib/gitea
# docker run -d --name=gitea -p 10022:22 -p 8765:3000 --restart unless-stopped -v /gitea:/data gitea/gitea:latest

# 更新
# docker pull gitea/gitea