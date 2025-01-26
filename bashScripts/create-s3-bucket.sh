#!/usr/bin/env bash

# Default values
REGION="us-east-1"


# Check if bucket name is provided
if [ -z "$1" ]; then
  echo "Error: Bucket name is required"
fi

BUCKET_NAME=$1

# Create the S3 bucket
aws s3api create-bucket --bucket $BUCKET_NAME \
  --create-bucket-configuration "LocationConstraint=eu-north-1" 
