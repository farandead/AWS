
## Create Bucket
aws s3 mb s3://cors-for-fun-278

## Change block public access
```sh
aws s3api put-public-access-block --bucket cors-for-fun-278 --public-access-block-configuration BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false
```

## Create a bucket policy
```sh
aws s3api put-bucket-policy --bucket cors-for-fun-278 --policy file://policy.json
```
## Turn on static website hosting
```sh
aws s3api put-bucket-website --bucket cors-for-fun-278 --website-configuration file://website.json
```
## Access the website endpoint

 [this link](http://cors-for-fun-278.s3-website.eu-north-1.amazonaws.com).

 ## Create API gateway with mock response and then test the endpoint
[link](https://f7duyhth4g.execute-api.eu-north-1.amazonaws.com/Prod/hello)


## Set cors on the bucket
```sh
aws s3api put-bucket-cors --bucket cors-for-fun-278 --cors-configuration file://cors.json
```
 