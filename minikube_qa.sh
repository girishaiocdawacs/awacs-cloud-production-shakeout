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

kubectl create secret tls qa.awacscloud.tech --cert=zerossl/qa_certificate.crt --key=zerossl/qa_private.key

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

#kubectl create -f nginx.yaml

kubectl apply -f nginx-deployment.yaml
kubectl apply -f nginx-service.yaml

sleep 10;

kubectl create configmap nginx-config --from-file=awacs-nginx-qa.conf

kubectl create configmap nginx-ssl  --from-file=zerossl/qa_certificate.crt --from-file=zerossl/qa_private.key

# kubectl apply -f multi-app-ingress.yaml

sleep 10


kubectl get all

minikube service nginx
