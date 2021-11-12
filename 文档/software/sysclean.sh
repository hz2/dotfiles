
#!/bin/sh

df -h / /home

echo 清理日志
rm -rf /var/log/user.log
rm -rf /var/log/messages
rm -rf /var/log/daemon.log
rm -rf /var/log/syslog*

echo 自动清理 apt
apt autoremove 
apt autoclean

echo 清理 apt 缓存
rm -rf /var/cache/apt

echo 清理 snap 缓存
rm -rf /var/lib/snapd/cache

echo 清理 flatpak 临时文件
rm -rf /var/tmp/flatpak-*

echo 清理 docker
docker system prune -f

df -h / /home
