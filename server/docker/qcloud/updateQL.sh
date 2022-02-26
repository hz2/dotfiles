#!/bin/sh
docker system prune -f
docker rm -f qinglong
docker pull whyour/qinglong
docker run -dit -v $pwd/ql/config:/ql/config -v $pwd/ql/log:/ql/log -v $pwd/ql/db:/ql/db -p 8086:5700 -e ENABLE_HANGUP=true -e ENABLE_WEB_PANEL=true --name qinglong --hostname qinglong --restart always whyour/qinglong
