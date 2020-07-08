# instala
sudo su
cd
curl https://get.acme.sh | sh
# E isso ja cria o cron dele

# edita certificado
export  AWS_ACCESS_KEY_ID=XXXXXXXXXX
export  AWS_SECRET_ACCESS_KEY=XXXXXXXXXXXXXXX

acme.sh \
-d meusite.com.br \
--dns dns_aws \
--dnssleep 5 \
--issue \
--key-file /caminho/da/privkey.pem \
--fullchain-file /caminho/da/fullchain.pem \
--reloadcmd "nginx -t && service nginx reload"
