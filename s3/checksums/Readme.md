## Create a new s3 bucket
```md
aws s3 mb s3://checksums-examples-ce-2342
```


## Create a file that will we do a cheksum on
```md
echo "Hello Mars" > myfile.txt
```


## Get a checksum of a file for md5
```md
md5sum myfile.txt
```


## Upload our file to S3
```md
aws s3 cp myfile.txt s3://cheksums-example-ce-2342
aws s3api head-object --bucket checksums-examples-ce-2342 --key myfile.txt
```


## Lets upload a file with different kind of checksum
```sh
sha1sum myfile.txt
```

```sh
aws s3api put-object \
--bucket checksums-examples-ce-2342 \
--key myfilesh1.txt \
--body myfile.txt \
--cheksum-algorithm="SHA1" \
--cheksum-sha1=""
```