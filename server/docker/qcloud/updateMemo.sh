

#!/bin/sh
docker system prune -f
docker rm -f the-memo
docker pull ccr.ccs.tencentyun.com/hzsq/loving-memo:latest
docker run -d --name the-memo -p 8520:80 ccr.ccs.tencentyun.com/hzsq/loving-memo:latest
