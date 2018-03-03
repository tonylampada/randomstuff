sudo su

swapon -s
free -m
df -h

fallocate -l 4G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile

echo /swapfile   none    swap    sw    0   0 >> /etc/fstab

cat /proc/sys/vm/swappiness
cat /proc/sys/vm/vfs_cache_pressure

sysctl vm.vfs_cache_pressure=50
sysctl vm.swappiness=10

echo vm.swappiness=10 >> /etc/sysctl.conf
echo vm.vfs_cache_pressure=50 >> /etc/sysctl.conf

echo ---------------------------------------------
swapon -s
free -m
cat /proc/sys/vm/swappiness
cat /proc/sys/vm/vfs_cache_pressure
cat /etc/fstab
