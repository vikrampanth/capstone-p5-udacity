# EKS cluster creation & deletion using eksctl command
eksctl create cluster --name="Capstone-VP" --nodes-min=3 --nodes-max=5 --node-type=t3.medium
eksctl delete cluster --name="Capstone-6ab9871"

# Kube Detail
aws eks update-kubeconfig --region us-west-2 --name Capstone-c5f0a6b
kubectl config view --minify
kubectl config use-context arn:aws:eks:us-west-2:877716312368:cluster/Capstone-c5f0a6b

kubectl get svc
kubectl get event 

kubectl apply -f kubernetes/aws-auth-cm.yaml
kubectl get cm aws-auth -o yaml

kubectl apply -f kubernetes/deployment.yml
kubectl apply -f kubernetes/service.yml
kubectl get nodes
kubectl get deployment
kubectl describe deployment
kubectl get pods -o wide
kubectl describe pods
kubectl get services
kubectl describe service

kubectl rollout status deployment udacitycapstone

kubectl delete -f kubernetes/service.yml
kubectl delete -f kubernetes/deployment.yml

kubectl annotate serviceaccount --overwrite -n kube-system aws-node eks.amazonaws.com/role-arn=arn:aws:iam::877716312368:role/EKS-Capstone-project


Kube Dashboard - 

wget -O v0.3.6.tar.gz https://codeload.github.com/kubernetes-sigs/metrics-server/tar.gz/v0.3.6 
tar -xzf v0.3.6.tar.gz

kubectl apply -f metrics-server-0.3.6/deploy/1.8+/
kubectl get deployment metrics-server -n kube-system
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0-beta8/aio/deploy/recommended.yaml
kubectl proxy

Access procxy here - 
http://127.0.0.1:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/