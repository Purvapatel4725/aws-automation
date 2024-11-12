#!/bin/bash

while getopts 't:' flag
do
	case "${flag}" in
		t) tag=${OPTARG};;
	esac
done

aws ec2 stop-instances --instance-ids $(aws ec2 describe-instances --filter "Name=tag:Faculty,Values=$tag" --query Reservations[].Instances[].[InstanceId] --output text)
