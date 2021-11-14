
#!/bin/sh

df -h / /home

echo 清理日志
journalctl --disk-usage
du -sh /var/log/journal/
journalctl --vacuum-time=3d
rm -rf /var/log/user.log
rm -rf /var/log/messages
rm -rf /var/log/daemon.log
rm -rf /var/log/syslog*

echo 自动清理 apt
apt autoremove 
apt autoclean

echo 清理 apt 缓存
du -sh /var/cache/apt
rm -rf /var/cache/apt

echo 清理 snap 缓存

du -h  /var/lib/snapd/snaps 
# Removes old revisions of snaps
# CLOSE ALL SNAPS BEFORE RUNNING THIS
set -eu
snap list --all | awk '/disabled/{print $1, $3}' |
    while read snapname revision; do
        snap remove "$snapname" --revision="$revision"
    done

du -sh /var/lib/snapd/cache
rm -rf /var/lib/snapd/cache

echo 清理 flatpak 临时文件
du -sh /var/tmp/flatpak-*
rm -rf /var/tmp/flatpak-*

echo 清理 docker
docker system df
docker system prune -f
docker volume prune -f
docker system df

echo 清理 npm
npm cache verify


df -h / /home
