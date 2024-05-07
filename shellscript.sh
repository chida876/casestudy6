# In the user_data section of the EC2 instance resource
user_data = <<-EOF
#!/bin/bash
# Install AWS CLI
yum install -y aws-cli

# Shell script to read files from S3 bucket
aws s3 cp s3://case6_bucket_871996/ /path/to/local/directory --recursive

# Install CloudWatch Logs agent
wget https://s3.amazonaws.com/aws-cloudwatch/downloads/latest/awslogs-agent-setup.py
chmod +x ./awslogs-agent-setup.py
./awslogs-agent-setup.py -n -r your_aws_region -c /path/to/cloudwatch-config-file.cfg
EOF
