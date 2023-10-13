# Automating AWS Resource Listing using AWS CLI and Cron

This guide demonstrates how to automate the listing of AWS resources using a Bash script, AWS Command Line Interface (CLI), and Cron. This enables you to conveniently retrieve information about EC2 instances, S3 buckets, Lambda functions, and IAM users on a regular schedule.

## Prerequisites

Before you proceed, ensure you have the following prerequisites in place:

1. **AWS Command Line Interface (CLI)**:
   Install and configure the AWS CLI with the necessary credentials. The CLI provides a command-line interface to interact with AWS services, allowing you to manage your resources programmatically. Follow the instructions in the [AWS documentation](https://aws.amazon.com/cli/) to install and configure the AWS CLI for your environment.

   To check the version of AWS CLI installed, use:
   ```bash
   aws --version
   ```

   To configure the CLI and set up credentials, use:
   ```bash
   aws configure
   ```

2. **AWS Access Key and Secret Key**:
   Create and save your Access Key and Secret Key credentials from the AWS console. Access the credentials by clicking on your profile at the top right in the AWS console, then navigate to Security Credentials. These credentials are required for authenticating AWS CLI and syncing with the AWS console.

## Steps Involved

### 1. Craft the Bash Script

Create a Bash script that utilizes AWS CLI commands to list your desired AWS resources, such as EC2 instances, S3 buckets, Lambda functions, and IAM roles. The script will simply list these resources.

```bash
#!/bin/bash

# Date and time at the running of the script
echo "Cron job ran at $(date)"

# List EC2 instance IDs
echo "EC2 instances:"
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId'

# List S3 Buckets
echo "S3 Buckets:"
aws s3 ls

# List Lambda Functions
echo "Lambda Functions:"
aws lambda list-functions

# List IAM Users
echo "IAM users:"
aws iam list-users
```

Make the script executable using the command:
```bash
chmod +x script.sh
```

### 2. Set up the Cron Job

Utilize the power of Cron to schedule the execution of your script at a designated time every day. This example schedules the script to run every day at 6 PM IST.

```bash
# Edit crontab file
crontab -e

# Add the following line to schedule the script
0 18 * * * /path/to/the/script.sh >> output.log 2>&1
```

The cron job is scheduled in the format of minute(0), hour(18 which corresponds to 6 PM IST), day of the month(*), month(*), and day of the week(*). The `>>` redirects the output to `output.log` and appends the output each time the cron job runs.

---

Feel free to customize the GitHub post and README according to your preferences and repository structure. If you have any further questions or need additional assistance, please let me know!
