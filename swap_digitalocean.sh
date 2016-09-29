# "atalho" pra https://www.digitalocean.com/community/tutorials/how-to-add-swap-on-ubuntu-14-04

sudo swapon -s
free -m
df -h


sudo fallocate -l 4G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile

sudo swapon -s
free -m

sudo nano /etc/fstab
# /swapfile   none    swap    sw    0   0


cat /proc/sys/vm/swappiness
cat /proc/sys/vm/vfs_cache_pressure

sudo sysctl vm.vfs_cache_pressure=50
sudo sysctl vm.swappiness=10

sudo nano /etc/sysctl.conf

# vm.swappiness=10
# vm.vfs_cache_pressure=50
