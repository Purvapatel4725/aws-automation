#!/bin/bash

aws ec2 describe-images --owners amazon --filters Name=name,Values=ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64* --query 'Images[*].[ImageId,CreationDate]' --output text | sort -k2 -r | head -n1 | awk '{print $1}'
