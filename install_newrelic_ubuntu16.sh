echo "license_key: your_license_key" | sudo tee -a /etc/newrelic-infra.yml
sudo echo "display_name: nome_da_maquina" >> /etc/newrelic-infra.yml
curl https://download.newrelic.com/infrastructure_agent/gpg/newrelic-infra.gpg | sudo apt-key add -

# ubuntu 14
printf "deb [arch=amd64] http://download.newrelic.com/infrastructure_agent/linux/apt trusty main" | sudo tee -a /etc/apt/sources.list.d/newrelic-infra.list

# ubuntu16
printf "deb [arch=amd64] http://download.newrelic.com/infrastructure_agent/linux/apt xenial main" | sudo tee -a /etc/apt/sources.list.d/newrelic-infra.list

sudo apt-get update
sudo apt-get install newrelic-infra -y
