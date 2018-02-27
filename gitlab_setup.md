/home/ubuntu/dkgitlab.sh

```
sudo docker run --detach \
    --hostname gitlab.example.com \
    --publish 8443:443 --publish 8080:80 --publish 2222:22 \
    --name gitlab \
    --restart always \
    --volume /home/ubuntu/dkdata/gitlab/config:/etc/gitlab \
    --volume /home/ubuntu/dkdata/gitlab/logs:/var/log/gitlab \
    --volume /home/ubuntu/dkdata/gitlab/data:/var/opt/gitlab \
    gitlab/gitlab-ce:latest
```

/etc/nginx/sites-enabled/gitlab.conf

```
server {
   server_name gitlab.example.com;
   listen 80

   location / {
        proxy_pass http://localhost:8080;
        include proxy_params;
   }
}
```

/home/ubuntu/dkdata/gitlab/config/gitlab.rb

```
...
gitlab_rails['gitlab_shell_ssh_port'] = 2222
...
gitlab_rails['smtp_enable'] = true
gitlab_rails['smtp_address'] = "smtp.mailgun.org"
gitlab_rails['smtp_port'] = 587
gitlab_rails['smtp_user_name'] = "postmaster@example.com"
gitlab_rails['smtp_password'] = "xxxxxxxxx"
gitlab_rails['smtp_domain'] = "example.com"
gitlab_rails['smtp_authentication'] = "plain"
gitlab_rails['smtp_enable_starttls_auto'] = true
```

Restart:

```
docker exec -it gitlab gitlab-ctl restart
```
