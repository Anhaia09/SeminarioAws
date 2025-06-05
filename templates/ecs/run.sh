#!/bin/bash

echo Carregando Variáveis de ambiente...
source .env

aws cloudformation create-stack \
  --stack-name seminario-stack \
  --template-body file://template.yaml \
  --parameters \
    ParameterKey=VpcId,ParameterValue=${VpcId} \
    ParameterKey=PublicSubnet1,ParameterValue=${PublicSubnet1} \
    ParameterKey=PublicSubnet2,ParameterValue=${PublicSubnet2} \
    ParameterKey=PrivateSubnet1,ParameterValue=${PrivateSubnet1} \
    ParameterKey=PrivateSubnet2,ParameterValue=${PrivateSubnet2} \
    ParameterKey=ContainerImage,ParameterValue=${ContainerImage} \
    ParameterKey=ECSTaskExecutionRole,ParameterValue=${ECSTaskExecutionRole} \
    ParameterKey=ECSTaskRole,ParameterValue=${ECSTaskRole} \
  --capabilities CAPABILITY_IAM || echo "ERRO ao criar o stack api-stack."

