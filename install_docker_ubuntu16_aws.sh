sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
sudo apt-get install docker-ce

sudo docker run hello-world
sudo usermod -aG docker ubuntu

# nao deixa o docker foder o disco da sua maquina com logs:
sudo nano /etc/docker/daemon.json  # edita o conteudo com o snippet abaixo
{
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "10m"
  }
}
sudo service docker restart

COMPOSER_VERSION=1.19.0  # ver https://github.com/docker/compose/releases
sudo curl -L https://github.com/docker/compose/releases/download/$COMPOSER_VERSION/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
