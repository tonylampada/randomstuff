# Instalação de docker e docker-compose no ubuntu / mint.

Esse procedimento foi tirado desses links:

* https://docs.docker.com/install/linux/docker-ce/ubuntu/
* https://docs.docker.com/compose/install/

Vira e mexe, a equipe do docker muda um pouco esse procedimento então é possível que o processo abaixo esteja desatualizado!

### docker

Instalação:

```bash
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Se for ubuntu:
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Se for mint
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

sudo apt-get update
sudo apt-get install docker-ce
```

Testa pra ver se funciona:

```bash
sudo docker run hello-world
```

Adicione seu usuário no grupo docker (pra não precisar fazer sudo nos comandos docker):

```bash
sudo usermod -aG docker ubuntu
```

**Precisa fazer logoff e login no ubuntu pra que o comando acima surta efeito!**

Testa de novo sem sudo:

```bash
docker run hello-world
```

Containers docker que ficam executando por muito tempo podem gerar output que por default é armazenado indefinidamente e dependendo do uso isso pode acabar com o espaço em disco. É recomendável configurar o docker pra limitar o armazenamento usado pra isso.

Edite o arquivo `/etc/docker/daemon.json` e se certifique de configurar as opções de log como no exemplo abaixo:

```
{
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "10m"
  }
}
```

Depois de editar o arquivo, reinicie o docker:

```bash
sudo service docker restart
```

### Compose

Instalação:

```bash
COMPOSER_VERSION=1.21.2  # ver https://github.com/docker/compose/releases
sudo curl -L https://github.com/docker/compose/releases/download/$COMPOSER_VERSION/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

Testa pra ver se tah ok:

```bash
docker-compose --version
```
