#! /bin/bash

[[ ! -d zerossl ]] && echo "ssl directory zerossl not found with certificate and key, unable to proceed, abort"

minikube version

minikube delete

minikube stop

#minikube start --cpus 4 --memory 8192
minikube start

kubectl config use-context minikube

kubectl get all

kubectl config view

kubectl delete all --all

kubectl create secret tls app.awacscloud.tech --cert=zerossl/certificate.crt --key=zerossl/private.key

kubectl apply -f adminer-deployment.yaml
kubectl apply -f adminer-service.yaml

kubectl apply -f db-deployment.yaml
kubectl apply -f db-service.yaml

kubectl apply -f jms-deployment.yaml
kubectl apply -f jms-service.yaml

sleep 10

kubectl apply -f productservice-deployment.yaml
kubectl apply -f productservice-service.yaml

kubectl apply -f socialweb-deployment.yaml
kubectl apply -f socialweb-service.yaml

kubectl apply -f adminserver-deployment.yaml
kubectl apply -f adminserver-service.yaml

kubectl apply -f authserver-deployment.yaml
kubectl apply -f authserver-service.yaml

sleep 30

kubectl apply -f nginx-deployment.yaml
kubectl apply -f nginx-service.yaml

sleep 10;

kubectl apply -f multi-app-ingress.yaml
kubectl expose service/nginx --port=80 --target-port=8080 --name=nginx-ingress --type=LoadBalancer

sleep 10


kubectl get all

minikube service nginx