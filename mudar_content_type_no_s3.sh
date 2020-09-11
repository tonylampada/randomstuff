vai.sh:


export AWS_ACCESS_KEY_ID=****
export AWS_SECRET_ACCESS_KEY=****
export AWS_REGION_NAME=****


# vai.sh
# ----------
aws s3 cp s3://buser-fin/$1 s3://buser-fin/$1 --no-guess-mime-type --content-type="application/pdf" --metadata-directive="REPLACE"

cat arquivos.txt | xargs -n 1 -P 100 ./vai.sh
