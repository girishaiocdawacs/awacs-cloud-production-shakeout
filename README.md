# awacs-cloud-production-shakeout



helm repo add bitnami https://charts.bitnami.com/bitnami
helm install nginx-release bitnami/nginx
sleep 10; kubectl get svc (check load balancer ip)
helm repo update
