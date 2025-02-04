## Create Bucket

aws s3 mb s3://change-storage-bucket


## Create File 

echo "Hello World" > hello.txt

aws s3 cp hell0.txt s3://change-storage-bucket --storage-class STANDARD_IA