#! /bin/bash

gcloud compute instances list

gcloud container clusters get-credentials cluster-1 --region us-central1-c

kubectl config get-contexts

kubectl config use-context gke_awacs-cloud-prod_us-central1-c_cluster-1

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


sleep 20

kubectl apply -f nginx-deployment.yaml
kubectl apply -f nginx-service-gcp.yaml

sleep 10;

kubectl delete configmap nginx-config
kubectl delete configmap nginx-ssl

kubectl create configmap nginx-config --from-file=awacs-nginx-gcp.conf
kubectl create configmap nginx-ssl  --from-file=zerossl/certificate.crt --from-file=zerossl/private.key

# kubectl apply -f multi-app-ingress.yaml

sleep 10

kubectl get all

kubectl get nodes


