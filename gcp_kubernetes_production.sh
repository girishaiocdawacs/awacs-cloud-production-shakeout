#! /bin/bash

. ./.concat.sh

gcloud compute instances list

gcloud container clusters get-credentials cluster-1 --region us-central1-c

kubectl config get-contexts

kubectl config use-context gke_awacs-cloud-prod_us-central1-c_cluster-1

kubectl get all

kubectl config view

kubectl delete all --all

kubectl create secret tls app.awacscloud.tech --cert=zerossl/app.awacscloud.tech.crt --key=zerossl/app.awacscloud.tech.key

sed -i 's/here_goes_github_token/4660eabfc92d3842555f829c14d2add8620f13fb/g' config-deployment.yaml
kubectl apply -f config-deployment.yaml
sed -i 's/4660eabfc92d3842555f829c14d2add8620f13fb/here_goes_github_token/g' config-deployment.yaml

kubectl apply -f config-service.yaml

kubectl apply -f peer1-deployment.yaml
kubectl apply -f peer1-service.yaml

kubectl apply -f hystrix-deployment.yml
kubectl apply -f hystrix-service.yml

sleep 30

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

kubectl apply -f otpservice.yaml


sleep 20

kubectl apply -f nginx-deployment.yaml
kubectl apply -f nginx-service-gcp.yaml

sleep 10;

kubectl delete configmap nginx-config
kubectl delete configmap nginx-ssl

kubectl create configmap nginx-config --from-file=awacs-nginx-gcp.conf
kubectl create configmap nginx-ssl  --from-file=zerossl/app.awacscloud.tech.crt --from-file=zerossl/app.awacscloud.tech.key

# kubectl apply -f multi-app-ingress.yaml

sleep 10

kubectl get all

kubectl get nodes

gcloud container clusters list

rm -rf zerossl/*awacscloud*
