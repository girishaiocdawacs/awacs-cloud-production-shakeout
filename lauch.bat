minikube -v

-- minikube delete

minikube stop

minikube start --cpus 4 --memory 8192

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

kubectl apply -f authserver-deployment.yaml
kubectl apply -f authserver-service.yaml

kubectl apply -f productservice-deployment.yaml
kubectl apply -f productservice-service.yaml

kubectl apply -f socialweb-deployment.yaml
kubectl apply -f socialweb-service.yaml

kubectl apply -f adminserver-deployment.yaml
kubectl apply -f adminserver-service.yaml


kubectl apply -f nginx-deployment.yaml
kubectl apply -f nginx-service.yaml

kubectl apply -f multi-app-ingress.yaml

kubectl get all
