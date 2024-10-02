#!/bin/bash

while getopts 'g:d:' flag
do
	case "${flag}" in
		g) groupname=${OPTARG};;
		d) desc=${OPTARG};;
	esac
done


aws ec2 create-security-group --group-name $groupname --description $desc
aws ec2 authorize-security-group-ingress --group-name $groupname --protocol tcp --port 22 --cidr 0.0.0.0/0

echo "Security group $groupname has been created sucessfully!"
