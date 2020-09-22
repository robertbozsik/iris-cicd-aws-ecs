#!/bin/bash

# login DockerHub
docker login --username $DOCKER_HUB_USER --password $DOCKER_HUB_PASS

# Push Dockerfile to DockerHub
docker-compose build --pull
docker-compose push

# installing aws command line tools to be able to launch aws commands from terminal
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip > /dev/null
sudo ./aws/install

# Login AWS
aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID
aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY
aws configure set region $AWS_DEFAULT_REGION

# Update service -> this line of code is where everything is deployed to aws
aws ecs update-service --cluster CICD-Cluster2 --service CICD-Container2-service --force-new-deployment