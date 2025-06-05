#!/bin/bash

echo "Subindo o NAT Gateway"
source nat/.env

aws cloudformation create-stack \
  --stack-name nat-gateway \
  --template-body file://nat/template.yaml \
  --parameters \
    ParameterKey=VpcId,ParameterValue=${VpcId} \
    ParameterKey=RouteTableId,ParameterValue=${RouteTableId} \
    ParameterKey=PubSubnetId,ParameterValue=${PubSubnetId} \
  --capabilities CAPABILITY_IAM || echo "ERRO ao criar o stack api-stack."

sleep 10

# Roda a stack do ECS
cd ecs/
source ./run.sh

