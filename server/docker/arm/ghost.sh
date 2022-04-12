
#!/bin/sh
docker system prune -f
docker rm -f some-ghost
docker pull ghost
docker run -d --name some-ghost -e url=https://years.huching.net -v /var/www/ghost-data:/var/lib/ghost/content -p 3001:2368 --restart unless-stopped ghost