#!/usr/bin/env bash

# Default region (can be overridden by AWS CLI default configuration)
REGION="eu-north-1"

# Check if bucket name is provided
if [ -z "$1" ]; then
  echo "Error: Bucket name is required."
  echo "Usage: $0 <bucket-name>"
  exit 1
fi

BUCKET_NAME=$1

# Confirm bucket deletion
read -p "Are you sure you want to delete the bucket '$BUCKET_NAME'? This action cannot be undone. (yes/no): " CONFIRM
if [ "$CONFIRM" != "yes" ]; then
  echo "Aborting bucket deletion."
  exit 1
fi

# Empty the S3 bucket
echo "Emptying the bucket: $BUCKET_NAME..."
aws s3 rm s3://$BUCKET_NAME --recursive --region $REGION

if [ $? -ne 0 ]; then
  echo "Error: Failed to empty the bucket. Check if the bucket exists and you have the correct permissions."
  exit 1
fi

# Delete the S3 bucket
echo "Deleting the bucket: $BUCKET_NAME..."
aws s3api delete-bucket --bucket $BUCKET_NAME --region $REGION

if [ $? -eq 0 ]; then
  echo "Bucket '$BUCKET_NAME' deleted successfully."
else
  echo "Error: Failed to delete the bucket. Ensure the bucket is empty and you have the necessary permissions."
  exit 1
fi

