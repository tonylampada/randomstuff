# baixar chrome
sudo dpkg -i ~/Downloads/google-chrome-stable_current_amd64.deb
# baixar gerenciar de senhas (chmod +x e vrau)

sudo apt update
sudo apt upgrade
sudo apt install terminator curl git xfce* htop dirmngr gnupg apt-transport-https ca-certificates software-properties-common
sudo apt install gcc libffi-dev libgeos-dev libmemcached-dev libpq-dev net-tools python3-gpg vim whois 
sudo apt install -y --no-install-recommends make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
sudo apt install gitk git-cola

# sublime
curl -fsSL https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo add-apt-repository "deb https://download.sublimetext.com/ apt/stable/"
sudo apt install sublime-text

# vscode, baixa e dpkg -i 
sudo dpkg -i ~/Downloads/code_1.72.2-1665614327_amd64.deb

# dropbox https://www.dropbox.com/install-linux
sudo dpkg -i ~/Downloads/dropbox_2020.03.04_amd64.deb

# docker
sudo apt remove -y docker docker-engine docker.io containerd runc
sudo apt install -y apt-transport-https ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker $USER
sudo apt install docker-compose-plugin
