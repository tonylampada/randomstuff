Boot dual no DELL Inspiron14 com windows 8:

QUASE segue esse tutorial aqui:
http://itsfoss.com/install-ubuntu-1404-dual-boot-mode-windows-8-81-uefi/

Exceto:

Na hora de setar as partições, se vc fizer só as 3 partições que ele fala, ao clicar "proximo" ele mostra um alerta reclamando que precisa de uma partição de boot.

O que eu fiz foi criar uma 4a partição do tipo boot, de 10Mb. Aih ele parou de reclamar.

Alem disso, na BIOS, tive que desabilitar o UEFI e habilitar o "modo legacy". E tb escolher o HD como primeiro dispositivo de boot.

Desse jeito, o linux boota por default (que eu prefiro). Pra entrar no windows eh necessario ligar o pc e apertar F12, e escolher "windows boot manager".


Depois, pra configurar o linux:

http://howtoubuntu.org/things-to-do-after-installing-ubuntu-14-04-trusty-tahr

+ pycharm
+ copy

nautilus-dropbox git git-cola gitg terminator
chromium-browser skype sublime-text-installer
sysv-rc-conf #roda como sudo e usa pra desabilitar o postgres por default

postgresql postgresql-server-dev-all python-dev python-lxml libxslt-dev libpq-dev pgadmin3

gnome

sudo apt-get install nodejs npm python-flake8 ruby
gem install sass
sudo ln -s /usr/bin/nodejs /usr/bin/node
nautilus-image-converter

sudo npm install -g grunt-cli

em additional drivers dah pra escolher um driver proprietario da nvidia


ctrl+alt+backspace

sudo nano /etc/default/keyboard

Press Enter. Your password will remain entirely invisible, not even dots will show, this is normal.

Find the line:
XKBOPTIONS=""

Replace it by this line (use copy/paste):
XKBOPTIONS="terminate:ctrl_alt_bksp"
