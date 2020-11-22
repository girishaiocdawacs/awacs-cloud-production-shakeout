# awacs-cloud-production-shakeout

![Minikube Staging](https://github.com/girishaiocdawacs/awacs-cloud-production-shakeout/workflows/Minikube%20Staging/badge.svg)

## Production (TODO) Live clusters GCP
[] helm repo add bitnami https://charts.bitnami.com/bitnami
[] helm install nginx-release bitnami/nginx
[] sleep 10; kubectl get svc (check load balancer ip)
[] helm repo update

## Staging (Done) - Minikube
[] mkdir zerossl
[] copy zerossl/certificate.crt and zerossl/private.key for SSL made to cluster LB host (apache2 in my case), same pair used by nginx for https ingress purpose
[] copy default-ssl.conf.apache2 on cluster /etc/apache2/conf/sites-enabled/ directory
[] It has a SSL proxy enabled https://app.awacscloud.tech/ like
   ```
      SSLEngine on
      # ssl config goes here
      SSLProxyEngine on
      
			#Replace value from command to internal ingress pods url
      ProxyPass /	$(minikube service nginx | grep 443 | sed -e 's/.*http/https/g' -e 's/ .*//g')
			ProxyPassReverse / ${minikube service nginx | grep 443 | sed -e 's/.*http/https/g' -e 's/ .*//g'}
      
   ```
[] ./launch.sh to spin up minikube staging environment

