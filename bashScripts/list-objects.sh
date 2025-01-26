#!/usr/bin/env bash

# List objects in an S3 bucket

# Check if bucket name is provided
if [ -z "$1" ]; then
  echo "Error: Bucket name is required"
  echo "Usage: $0 <bucket-name>"
  exit 1
fi

BUCKET_NAME=$1

echo "Listing objects in bucket: $BUCKET_NAME"
aws s3api list-objects-v2 --bucket "$BUCKET_NAME" --query "Contents[].{Key: Key, Size: Size}" --output table
