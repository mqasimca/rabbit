#!/bin/bash

awsRegion=$(curl -s http://169.254.169.254/latest/dynamic/instance-identity/document | jq .region -r)
awsInstanceId=$(curl -s http://169.254.169.254/latest/dynamic/instance-identity/document | jq .instanceId -r)

export AWS_DEFAULT_REGION=$awsRegion