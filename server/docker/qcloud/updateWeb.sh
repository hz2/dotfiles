
#!/bin/sh
docker system prune -f
docker rm -f some-cn
docker pull ccr.ccs.tencentyun.com/hzsq/huching-web:latest
docker run -d --name some-cn -p 8867:80 ccr.ccs.tencentyun.com/hzsq/huching-web:latest
