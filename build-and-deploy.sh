#!/bin/bash
# Build, push, deploy, and run post-deploy tasks for myapp.

# Define the version to be deployed (e.g. a git hash or semver tag).
version="1.0"
namespace="ecosia"

# Build and push the container image.
docker build -t ajaykatke/web:$version .
docker push ajaykatke/web:$version

# Update the myapp deployment in Kubernetes, in the namespace 'namespace'.
#kubectl create deployment ecosia --image=ajaykatke/web:$version -n ecosia
kubectl apply -f deploy.yaml -n $namespace


# Check deployment rollout status every 10 seconds (max 10 minutes) until complete.
ATTEMPTS=0
ROLLOUT_STATUS_CMD="kubectl rollout status ajaykatke/web:$version -n $namespace"
until $ROLLOUT_STATUS_CMD || [ $ATTEMPTS -eq 60 ]; do
  $ROLLOUT_STATUS_CMD
  ATTEMPTS=$((attempts + 1))
  sleep 10
done

# Run other post-deployment tasks, now that all new Pods are present, and old ones are gone.
kubectl expose deployment ecosia --type=LoadBalancer --port=2022 -n $namespace
kubectl apply -f ingress -n $namespace
sleep 1
#
#curl local.ecosia.org/tree 
