# awacs-cloud-production-shakeout

![Minikube Staging](https://github.com/girishaiocdawacs/awacs-cloud-production-shakeout/workflows/Minikube%20Staging/badge.svg)

![Newman Run](https://github.com/girishaiocdawacs/awacs-cloud-production-shakeout/workflows/Newman%20Run/badge.svg)


# ops status - 
## Production - AWS/GCP/Ali Terraform Kubernetes with Helm charts (Pending)
## QA (Done) - Docker Bastion
## Staging (Done) - Minikube Bastion + Vagrant virtualbox, here's steps
- minikube start
- mkdir zerossl
- copy zerossl/certificate.crt and zerossl/private.key for SSL made to cluster LB host (apache2 in my case), same pair used by nginx for https ingress purpose
- copy default-ssl.conf.apache2 on cluster /etc/apache2/conf/sites-enabled/ directory
- It has a SSL proxy enabled https://qa.awacscloud.tech/ like
 
   ```
      SSLEngine on
      # ssl config goes here
      SSLProxyEngine on
      
			#Replace value from command to internal ingress pods url
      ProxyPass /	$(minikube service nginx | grep 443 | sed -e 's/.*http/https/g' -e 's/ .*//g')
			ProxyPassReverse / ${minikube service nginx | grep 443 | sed -e 's/.*http/https/g' -e 's/ .*//g'}
      
   ```
   Example -
   ``` 
    giris@bastion-1:~/awacs-cloud-production-shakeout$ minikube service nginx | grep 443 | sed -e 's/.*http/https/g' -e 's/ .*//g'
    https://192.168.49.2:30847
    giris@bastion-1:~/awacs-cloud-production-shakeout$ grep 192.168 /etc/apache2/sites-enabled/default-ssl.conf
             ProxyPass /     https://192.168.49.2:30847/
             ProxyPassReverse / https://192.168.49.2:30847/
   giris@bastion-1:~/awacs-cloud-production-shakeout$
  ```
  
- ./launch.sh to spin up minikube staging environment including ingress arrangments

- minikube delete

## Production (TODO) Live clusters GCP
- helm repo add bitnami https://charts.bitnami.com/bitnami
- helm install nginx-release bitnami/nginx
- sleep 10; kubectl get svc (check load balancer ip)
- helm repo update

- steps from ./gcp_kubernetes_production.sh
