export CERTNAME=selfsigned   
export CERTDAYS=3650

# Adjust above to your needs


sudo mkdir -p /etc/nginx/ssl
sudo openssl req -x509 -nodes -days $CERTDAYS -newkey rsa:2048 -keyout /etc/nginx/ssl/$CERTNAME.key -out /etc/nginx/ssl/$CERTNAME.crt
# Attention: commonname must match the domain name that will be used for the website


# /etc/nginx/sites-enabled/yoursite.conf:

# server {
#   listen 80;
#   server_name your_domain.com;
#   return 301 https://$host$request_uri;
# }

# server {

#     listen 443 ssl;
#     server_name your_domain.com;
#     ssl_certificate /etc/nginx/ssl/<CERTNAME>.crt;
#     ssl_certificate_key /etc/nginx/ssl/<CERTNAME>.key;

#     #...

# }
