#!/bin/bash

echo "criando as imagens ....... "

docker build -t alissonmaia/projeto-backend:1.0 bakcend/.
docker build -t alissonmaia/projeto-database:1.0 database./

echo "realizando o push das imagens   ...."


docker push alissonmaia/projeto-backend:1.0
docker push alissonmaia/projeto-database:1.0

echo "Criando serviços no cluster kubernetes  ....."

kubectl apply -f ./services.yml

echo "Criando os deployments ......"
kubectl apply -f ./deployment.yml
