#!/bin/bash

#########################################

#Author: Amit Sharma
#Date: 14th October

#Version: V1

#This Script will report the AWS resource usage for following services-

#AWS EC2
#AWS S3
#AWS Lambda Functions
#AWS IAM Users

#########################################

#Cron Job Schedule
echo "Cron job ran at $(date)"
#List EC2 instances
echo "List of EC2 instances after JSON Parsing by filtering the information:"
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId'

#List S3 Buckets
echo "List of S3 Buckets:"
aws s3 ls

#List Lambda Functions
echo "List of Lambda Functions:"
aws lambda list-functions

#List IAM Users
echo "List of IAM users:"
aws iam list-users

