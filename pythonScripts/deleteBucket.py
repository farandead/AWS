import boto3
import sys
import botocore

# Default region
REGION = "eu-north-1"

def delete_bucket(bucket_name):
    s3 = boto3.resource('s3', region_name=REGION)
    client = boto3.client('s3', region_name=REGION)

    # Confirm bucket deletion
    confirm = input(f"Are you sure you want to delete the bucket '{bucket_name}'? This action cannot be undone. (yes/no): ")
    if confirm.lower() != "yes":
        print("Aborting bucket deletion.")
        sys.exit(1)

    try:
        # Empty the bucket
        print(f"Emptying the bucket: {bucket_name}...")
        bucket = s3.Bucket(bucket_name)
        bucket.objects.all().delete()

        # Delete the bucket
        print(f"Deleting the bucket: {bucket_name}...")
        client.delete_bucket(Bucket=bucket_name)
        print(f"Bucket '{bucket_name}' deleted successfully.")
    except botocore.exceptions.ClientError as error:
        if error.response['Error']['Code'] == 'NoSuchBucket':
            print(f"Error: Bucket '{bucket_name}' does not exist.")
        elif error.response['Error']['Code'] == 'AccessDenied':
            print(f"Error: Access denied. Check your permissions for the bucket '{bucket_name}'.")
        else:
            print(f"Error: {error.response['Error']['Message']}")
        sys.exit(1)

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python delete_s3_bucket.py <bucket-name>")
        sys.exit(1)

    bucket_name = sys.argv[1]
    delete_bucket(bucket_name)
