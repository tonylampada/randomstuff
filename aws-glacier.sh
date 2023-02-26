#upload

aws glacier upload-archive --account-id - --vault-name tonylampada --archive-description my-archive-description --body my-archive.tar.gz --debug

# ou entao usando o s3
aws s3 cp myfolder s3://mybucket/myfolder --recursive --storage-class GLACIER


# list files https://stackoverflow.com/questions/28945085/list-files-in-glacier-with-aws-cli
