#upload

aws glacier upload-archive --account-id - --vault-name tonylampada --archive-description my-archive-description --body my-archive.tar.gz --debug

# ou entao usando o s3
aws s3 cp myfolder s3://mybucket/myfolder --recursive --storage-class GLACIER
