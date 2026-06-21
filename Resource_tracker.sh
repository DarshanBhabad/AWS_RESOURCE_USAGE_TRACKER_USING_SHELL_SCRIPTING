#!/bin/bash
###############################
# Author: Darshan Bhabad
# Date:    2026-06-22
# version: 1.0
# Purpose: This script is used to track resource usage on a Aws account
# resourcestracker include Ec2,S3,Lamda, IAM
###############################

set -ex # debugging if there are errors simply exit .... set -x list the commands also

OUTPUT_FILE="/home/ubuntu/resources.txt"

# list s3 buckets
echo "Listing S3 Buckets..." >> $OUTPUT_FILE
aws s3 ls >> $OUTPUT_FILE #(these file will store the output of the command   > - will overrite rec.txt content each time, >> - will append the content to rec.txt file)

# list ec2 instances
echo "Listing EC2 Instances..." >> $OUTPUT_FILE
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' >> $OUTPUT_FILE

# list lambda functions
echo "Listing Lambda Functions..." >> $OUTPUT_FILE
aws lambda list-functions | jq '.Functions[].FunctionName' >> $OUTPUT_FILE

# list iam users
echo "Listing IAM Users..." >> $OUTPUT_FILE
aws iam list-users | jq '.Users[].UserName' >> $OUTPUT_FILE

# you will find these commands in documentation of aws cli
# vi Resource_tracker.sh
# i to insert the commands
# save and exit :wq
# chmod 777 Resource_tracker.sh
# ./Resource_tracker.sh to run the script or to execute