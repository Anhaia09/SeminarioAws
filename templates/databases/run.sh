#!/bin/bash

echo Carregando Variáveis de ambiente...
source .env

aws cloudformation create-stack \
  --stack-name db-rds \
  --template-body file://template.yaml \
  --parameters \
    ParameterKey=VpcId,ParameterValue=${VpcId} \
    ParameterKey=PrivateSubnet1,ParameterValue=${PrivateSubnet1} \
    ParameterKey=PrivateSubnet2,ParameterValue=${PrivateSubnet2} \
  --capabilities CAPABILITY_IAM || echo "ERRO ao criar o stack api-stack."

