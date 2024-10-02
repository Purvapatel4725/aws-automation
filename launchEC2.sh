#!/bin/bash

while getopts 'c:k:s' flag
do
	case "${flag}" in
		c) count=${OPTARG};;
		k) key=${OPTARG};;
		s) grp=${OPTARG};;
	esac
done


aws ec2 run-instances --image-id $(findAMI.sh) --count $count --instance-type t2.micro --key-name $key --security-groups $grp

echo "Sucess!!"
echo "Total number of VM generated: $count"
echo "Security Group used: $grp"
echo "Key used: $key"
