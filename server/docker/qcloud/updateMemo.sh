

#!/bin/sh
docker system prune -f
docker rm -f some-cn
docker pull ccr.ccs.tencentyun.com/hzsq/loving-memo:latest
docker run -d --name some-cn -p 8520:80 ccr.ccs.tencentyun.com/hzsq/loving-memo:latest
