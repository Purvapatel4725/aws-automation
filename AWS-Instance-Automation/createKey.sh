#!/bin/bash

while getopts 'n:' flag
do
	case "${flag}" in
		n) keyname=${OPTARG};;
	esac
done

filename=$keyname.pem

aws ec2 create-key-pair --key-name $keyname --query "KeyMaterial" --output text > $filename


chmod 600 $filename

echo "Key $keyname has been created!"
