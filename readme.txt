Prerequisites
1.Dockerhub sign in
2.minikube installed with ingress addon enabled
3.Run in the linux environment it has bash script.



dockerhub account for pulling the images
Docker images is in public 

Install python 3.7+
pip install klein

in browser URL would be localhost:2022/tree

docker pull ajaykatke/web:3.0

kubectl create deployment ecosia --image=ajaykatke/web:3.0
kubectl expose deployment ecosia --type=NodePort --port=2022
