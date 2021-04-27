#ubuntu 20

sudo apt update && sudo apt upgrade
sudo apt install unattended-upgrades apt-listchanges
sudo dpkg-reconfigure -plow unattended-upgrades
# YES
sudo unattended-upgrades --dry-run
