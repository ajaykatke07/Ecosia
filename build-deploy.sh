#/bin/bash
#Build dockerfile
docker build -t ecosia:1.0 .
#docker creating a runner
docker run -itd -p 8880:8880 --name ecosia ecosia:1.0
#docker push to register
docker push ecosia:1.0
#Creating a deplyment for kubernates
kubectl create deployment ecosia --image=ajaykatke/web:3.0
kubectl expose deployment ecosia --type=NodePort --port=2022
#creating a ingress using YAML file
kubectl apply -f ingress.yaml
#mapping

kubectl create deployment mapping-minikube --image=k8s.gcr.io/echoserver:1.4
kubectl expose deployment mapping-minikube --port=8080
