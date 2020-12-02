#Ubuntu <= 18.04

sudo apt-get update
sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:certbot/certbot
sudo apt-get update
sudo apt-get install -y python-certbot-nginx 
sudo certbot --nginx
sudo certbot renew --dry-run


# Ubuntu >= 20.04
sudo apt-get update
sudo apt-get install -y software-properties-common certbot python3-certbot-nginx
