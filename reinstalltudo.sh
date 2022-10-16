# baixar chrome
sudo dpkg -i ~/Downloads/google-chrome-stable_current_amd64.deb
# baixar gerenciar de senhas (chmod +x e vrau)

sudo apt update
sudo apt install terminator git xfce* htop dirmngr gnupg apt-transport-https ca-certificates software-properties-common

# sublime
curl -fsSL https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -sudo apt update

sudo add-apt-repository "deb https://download.sublimetext.com/ apt/stable/"
sudo apt install sublime-text
